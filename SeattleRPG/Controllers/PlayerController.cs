using Microsoft.AspNetCore.Mvc;
using SeattleRPG.Models;
using System.Collections.Generic;

namespace SeattleRPG.Controllers
{
  public class PlayerController : Controller
  {
    [HttpGet("/player")]
    public ActionResult Index()
    {
        return View();
    }

    [HttpPost("/player")]
    public ActionResult SubmitName()
    {

        string playerName = Request.Form["player-name"];
        Player newPlayer = new Player(playerName, 100, 50, 300, 0);
        newPlayer.UpdatePlayerProperties(playerName, 100, 50, 300, 0);

        //model.Add("currentPlayer", newPlayer);
//save here
        return RedirectToAction("Index", "Scenario", new { id = 1 });
    }

    [HttpGet("/player/end")]
    public ActionResult GameOver()
    {
        // Player currentPlayer = new Player
        return View(Highscore.GetHighestScore());
    }
  }
}
