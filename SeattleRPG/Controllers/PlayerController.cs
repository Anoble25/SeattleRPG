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
        Player newPlayer = new Player(playerName);
        Dictionary<string, object> model=new Dictionary<string, object>();

        model.Add("currentPlayer", newPlayer);
//save here
        return RedirectToAction("Index", "Scenario", new { id = 1 });
    }

  }
}
