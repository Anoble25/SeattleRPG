using Microsoft.AspNetCore.Mvc;
using SeattleRPG.Models;
using System.Collections.Generic;

namespace SeattleRPG.Controllers
{
  public class ScenarioController : Controller
  {
    [HttpGet("/scenarios/{id}")]
    public ActionResult Index(int id)
    {
      Dictionary<string, object> model = new Dictionary<string, object>();
      //List<Scenario> allScenarios = Scenario.GetAll();
      Scenario selectedScenario=Scenario.Find(id);
      Player currentPlayer=Player.Find(0);
      model.Add("selectedScenario", selectedScenario);
      model.Add("currentPlayer", currentPlayer);
      // game.Add("allScenarios", allScenarios);
      return View(model);

      //return View();
    }

    [HttpPost("/scenarios/{id}")]
    public ActionResult IndexPost(int id)
    {
      Player currentPlayer=Player.Find(0);
      Scenario selectedScenario=Scenario.Find(id);
      int choice=int.Parse(Request.Form["buttonVal"]);

      int currentHealth=currentPlayer.GetHealth();
      int currentMood=currentPlayer.GetMood();
      int currentMoney=currentPlayer.GetMoney();
      string playerName=currentPlayer.GetName();

      int healthChange=0;
      int moodChange=0;
      int moneyChange=0;

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

      currentPlayer.UpdatePlayerProperties(playerName, currentHealth, currentMood, currentMoney);

      return RedirectToAction("Index", "Scenario", new { id = id+1});
    }
  }
}
