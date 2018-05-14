using System.Collections.Generic;
using MySql.Data.MySqlClient;
using System;

namespace SeattleRPG.Models
{
    public class Scenario
    {
        private int _id;
        private string _ScenarioName;

        public Scenario(string name, int id=0)
        {
          _id = id;
          _name = name;

        }

        public int GetScenarioId()
        {
          return _id;
        }

        public string GetName()
        {
          return _name;
        }

        public static List<Scenario> GetAll()
        {
          List<Scenario> allScenarios = new List<Scenario> {};
          MySqlConnection conn = DB.Connection();

          conn.Open();

          MySqlCommand cmd = conn.CreateCommand() as MySqlCommand;

          cmd.CommandText = @"SELECT * FROM scenarios;";
          MySqlDataReader rdr = cmd.ExecuteReader() as MySqlDataReader;

          while(rdr.Read())
          {
            int scenarioId = rdr.GetInt32(0);
            string scenarioName = rdr.GetString(1);

            Scenario newScenario = new Scenario(scenarioName, scenarioId);

            allScenarios.Add(newScenario);
          }

          conn.Close();
          if (conn != null)
          {
            conn.Dispose();
          }
          return allScenarios;
        }

        // public override bool Equals(System.Object otherScenario)
        // {
        //   if (!(otherScenario is Scenario))
        //   {
        //     return false;
        //   }
        //   else
        //   {
        //     Scenario newScenario = (Scenario) otherScenario;
        //     bool idEquality = (this.GetId() == newScenario.GetId());
        //     //when we change an object from one type to another, its called "TYPE CASTING"
        //     bool nameEquality = (this.GetName() == newScenario.GetName());
        //     return (idEquality && nameEquality);
        //   }
        // }

        public static Scenario Find(int id)
        {
          MySqlConnection conn = DB.Connection();
          conn.Open();
          var cmd = conn.CreateCommand() as MySqlCommand;
          cmd.CommandText = @"SELECT * FROM scenarios WHERE id = (@searchId);";

          MySqlParameter searchId = new MySqlParameter();
          searchId.ParameterName = "@searchId";
          searchId.Value = id;
          cmd.Parameters.Add(searchId);

          var rdr = cmd.ExecuteReader() as MySqlDataReader;
          int scenarioId = 0;
          string scenarioName = "";

          while(rdr.Read())
          {
            scenarioId = rdr.GetInt32(0);
            scenarioName = rdr.GetString(1);
          }

          // Constructor below no longer includes a itemCategoryId parameter:
          Scenario newScenario = new Scenario(scenarioName, scenarioId);
          conn.Close();
          if (conn != null)
          {
              conn.Dispose();
          }

          return newScenario;
        }
      }
    }
