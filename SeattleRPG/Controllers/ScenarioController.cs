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
      //List<Scenario> allScenarios = Scenario.GetAll();
      Scenario selectedScenario=Scenario.Find(id);
      // game.Add("allScenarios", allScenarios);
      return View(selectedScenario);

      //return View();
    }

    [HttpPost("/scenarios/{id}")]
    public ActionResult IndexPost(int id)
    {
      //List<Scenario> allScenarios = Scenario.GetAll();


      // game.Add("allScenarios", allScenarios);
      return RedirectToAction("Index", "Scenario", new { id = id+1});

      //return View();
    }
  }
}
