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
      List<Player> allPlayers = Player.GetAll();
      return View(allPlayers);
    }
  }
}
