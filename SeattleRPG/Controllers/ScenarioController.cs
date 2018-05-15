using Microsoft.AspNetCore.Mvc;
using SeattleRPG.Models;
using System.Collections.Generic;

namespace SeattleRPG.Controllers
{
  public class ScenarioController : Controller
  {
    [HttpGet("/scenarios")]
    public ActionResult Index()
    {
      List<Scenario> allScenarios = Scenario.GetAll();
      // game.Add("allScenarios", allScenarios);
      return View(allScenarios);

      //return View();
    }
  }
}
