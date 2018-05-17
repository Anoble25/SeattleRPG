using Microsoft.AspNetCore.Mvc;
using SeattleRPG.Models;
using System.Collections.Generic;
using System;

namespace SeattleRPG.Controllers
{
  public class ScenarioController : Controller
  {
    [HttpGet("/scenarios/{id}")]
    public ActionResult Index(int id)
    {
      Dictionary<string, object> model = new Dictionary<string, object>();

      Random rnd = new Random();
      int randomId=rnd.Next(1,50);

      Scenario selectedScenario=Scenario.Find(randomId);
      Player currentPlayer=Player.Find(0);

      int previousChoice=currentPlayer.GetPreviousChoice();
      int previousScenarioId=currentPlayer.GetPreviousScenarioId();

      //Console.WriteLine("Previous Scenario ID on Get = "+previousScenarioId+"Day Id= "+id);
      int healthChange=0;
      int moodChange=0;
      int moneyChange=0;
      string healthChangeString="";
      string moodChangeString="";
      string moneyChangeString="";

      string previousChoiceText="";



      if (id==1){
        //Scenario previousScenario=Scenario.Find(0);
        model.Add("previousChoiceText", "This is where the consequences of your actions will show.");

      } else{

        if (previousChoice==1){
          Scenario previousScenario=Scenario.Find(previousScenarioId);
          previousChoiceText=previousScenario.GetOpt1ResultText();
          healthChange=previousScenario.GetOpt1Health();
          moodChange=previousScenario.GetOpt1Mood();
          moneyChange=previousScenario.GetOpt1Money();
        } else if (previousChoice==2)
        {
          Scenario previousScenario=Scenario.Find(previousScenarioId);
          previousChoiceText=previousScenario.GetOpt2ResultText();
          healthChange=previousScenario.GetOpt2Health();
          moodChange=previousScenario.GetOpt2Mood();
          moneyChange=previousScenario.GetOpt2Money();

        } else if (previousChoice==3){
          Scenario previousScenario=Scenario.Find(previousScenarioId);
          previousChoiceText=previousScenario.GetOpt3ResultText();
          healthChange=previousScenario.GetOpt3Health();
          moodChange=previousScenario.GetOpt3Mood();
          moneyChange=previousScenario.GetOpt3Money();
        } else{}

        if (healthChange==0){
          healthChangeString="No Change";
        } else if (healthChange<0){
          healthChangeString=""+healthChange.ToString();
        } else if (healthChange>0){
          healthChangeString="+"+healthChange.ToString();
        } else{
          Console.WriteLine("error calculating health change string");
        }

        if (moodChange==0){
          moodChangeString="No Change";
        } else if (moodChange<0){
          moodChangeString=""+moodChange.ToString();
        } else if (moodChange>0){
          moodChangeString="+"+moodChange.ToString();
        } else{
          Console.WriteLine("error calculating mood change string");
        }

        if (moneyChange==0){
          moneyChangeString="No Change";
        } else if (moneyChange<0){
          moneyChangeString=""+moneyChange.ToString();
        } else if (moneyChange>0){
          moneyChangeString="+"+moneyChange.ToString();
        } else{
          Console.WriteLine("error calculating money change string");
        }
        model.Add("previousChoiceText", previousChoiceText);
      }

      currentPlayer.SetPreviousScenarioId(randomId);
      currentPlayer.UpdatePreviousScenarioId(randomId);
      model.Add("healthChange", healthChangeString);
      model.Add("moodChange", moodChangeString);
      model.Add("moneyChange", moneyChangeString);
      model.Add("selectedScenario", selectedScenario);
      model.Add("currentPlayer", currentPlayer);
      model.Add("day", id);
      // game.Add("allScenarios", allScenarios);
      return View(model);

      //return View();
    }

    [HttpPost("/scenarios/{id}")]
    public ActionResult IndexPost(int id)
    {
      Player currentPlayer=Player.Find(0);

      int previousScenarioId=currentPlayer.GetPreviousScenarioId();
      Scenario selectedScenario=Scenario.Find(previousScenarioId);
      int choice=int.Parse(Request.Form["buttonVal"]);
      currentPlayer.SetPreviousChoice(choice);
      // currentPlayer.SetPreviousScenarioId(id);

      //Console.WriteLine("Previous Scenario ID on Post = "+previousScenarioId+"Day Id= "+id);
      int currentHealth=currentPlayer.GetHealth();
      int currentMood=currentPlayer.GetMood();
      int currentMoney=currentPlayer.GetMoney();
      string playerName=currentPlayer.GetName();

      int healthChange=0;
      int moodChange=0;
      int moneyChange=0;
      int rentPayment=currentPlayer.GetMoney();

      if (choice==1){
        healthChange=selectedScenario.GetOpt1Health();
        moodChange=selectedScenario.GetOpt1Mood();
        moneyChange=selectedScenario.GetOpt1Money();
      } else if (choice==2){
        healthChange=selectedScenario.GetOpt2Health();
        moodChange=selectedScenario.GetOpt2Mood();
        moneyChange=selectedScenario.GetOpt2Money();
      } else if (choice==3){
        healthChange=selectedScenario.GetOpt3Health();
        moodChange=selectedScenario.GetOpt3Mood();
        moneyChange=selectedScenario.GetOpt3Money();
      }
      else{}

      currentHealth=currentHealth+healthChange;
      currentMood=currentMood+moodChange;
      currentMoney=currentMoney+moneyChange;

      currentPlayer.UpdatePlayerProperties(playerName, currentHealth, currentMood, currentMoney, choice, previousScenarioId);

      if (currentMood<0||currentMoney<0||currentHealth<0){
        return RedirectToAction("LoseGame", "Scenario", new { id = id});
      } else if (id==30){


        if (rentPayment>=1500){
          return RedirectToAction("Victory", "Scenario");
        }
        else{
          return RedirectToAction("LoseGame", "Scenario", new { id = id});
        }
      }
      else{
        return RedirectToAction("Index", "Scenario", new { id = id+1});
      }
    }

    [HttpGet("/scenarios/victory")]
    public ActionResult Victory()
    {
      Dictionary<string, object> model = new Dictionary<string, object>();
      Player currentPlayer=Player.Find(0);
      string name=currentPlayer.GetName();
      int score=currentPlayer.GetMoney();


      Highscore newHighscore=new Highscore(name, score);
      newHighscore.SaveScore();
      model.Add("currentPlayer", currentPlayer);


      return View(model);
    }

    [HttpGet("/scenarios/losegame")]
    public ActionResult LoseGame(int id)
    {
      Dictionary<string, object> model = new Dictionary<string, object>();
      Player currentPlayer=Player.Find(0);
      string day=id.ToString();
      model.Add("currentPlayer", currentPlayer);
      model.Add("day", day);

      return View(model);
    }


    [HttpPost("/player/{name}/{score}/end")]
    public ActionResult EndOfTheGame(string name, int score)
    {
      //Highscore newHighscore = new Highscore(name, score);
      // newHighscore.SaveScore();
      return RedirectToAction("Index", "Player");
    }
  }
}
