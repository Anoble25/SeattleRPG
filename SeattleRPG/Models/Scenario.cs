using System.Collections.Generic;
using MySql.Data.MySqlClient;
using System;

namespace SeattleRPG.Models
{
    public class Scenario
    {
        private int _id;
        private string _scenario_name;
        private string _prompt_text;
        private string _opt_1_choice_text;
        private string _opt_1_result_text;
        private int _opt_1_health;
        private int _opt_1_money;
        private int _opt_1_mood;
        private string _opt_2_choice_text;
        private string _opt_2_result_text;
        private int _opt_2_health;
        private int _opt_2_money;
        private int _opt_2_mood;
        private string _opt_3_choice_text;
        private string _opt_3_result_text;
        private int _opt_3_health;
        private int _opt_3_money;
        private int _opt_3_mood;


        public Scenario(int id, string scenario_name, string prompt_text, string opt_1_choice_text, string opt_1_result_text, int opt_1_health, int opt_1_money, int opt_1_mood, string opt_2_choice_text, string opt_2_result_text, int opt_2_health, int opt_2_money, int opt_2_mood, string opt_3_choice_text, string opt_3_result_text, int opt_3_health, int opt_3_money, int opt_3_mood)
        {
          _id=id;
          _scenario_name=scenario_name;
          _prompt_text=prompt_text;
          _opt_1_choice_text=opt_1_choice_text;
          _opt_1_result_text=opt_1_result_text;
          _opt_1_health=opt_1_health;
          _opt_1_money=opt_1_money;
          _opt_1_mood=opt_1_mood;
          _opt_2_choice_text=opt_2_choice_text;
          _opt_2_result_text=opt_2_result_text;
          _opt_2_health=opt_2_health;
          _opt_2_money=opt_2_money;
          _opt_2_mood=opt_2_mood;
          _opt_3_choice_text=opt_3_choice_text;
          _opt_3_result_text=opt_3_result_text;
          _opt_3_health=opt_3_health;
          _opt_3_money=opt_3_money;
          _opt_3_mood=opt_3_mood;
        }

        public int GetScenarioId()
        {
          return _id;
        }

        public string GetScenarioName()
        {
          return _scenario_name;
        }

        public string GetPromptText()
        {
          return _prompt_text;
        }

        public string GetOpt1ChoiceText()
        {
          return _opt_1_choice_text;
        }
        public string GetOpt1ResultText()
        {
          return _opt_1_result_text;
        }
        public int GetOpt1Health()
        {
          return _opt_1_health;
        }
        public int GetOpt1Money()
        {
          return _opt_1_money;
        }
        public int GetOpt1Mood()
        {
          return _opt_1_mood;
        }
        public string GetOpt2ChoiceText()
        {
          return _opt_2_choice_text;
        }
        public string GetOpt2ResultText()
        {
          return _opt_2_result_text;
        }
        public int GetOpt2Health()
        {
          return _opt_2_health;
        }
        public int GetOpt2Money()
        {
          return _opt_2_money;
        }
        public int GetOpt2Mood()
        {
          return _opt_2_mood;
        }
        public string GetOpt3ChoiceText()
        {
          return _opt_3_choice_text;
        }
        public string GetOpt3ResultText()
        {
          return _opt_3_result_text;
        }
        public int GetOpt3Health()
        {
          return _opt_3_health;
        }
        public int GetOpt3Money()
        {
          return _opt_3_money;
        }
        public int GetOpt3Mood()
        {
          return _opt_3_mood;
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
            int id = rdr.GetInt32(0);
            string scenario_name = rdr.GetString(1);
            string prompt_text = rdr.GetString(2);
            string opt_1_choice_text = rdr.GetString(3);
            string opt_1_result_text = rdr.GetString(4);
            int opt_1_health = rdr.GetInt32(5);
            int opt_1_money = rdr.GetInt32(6);
            int opt_1_mood = rdr.GetInt32(7);
            string opt_2_choice_text= rdr.GetString(8);
            string opt_2_result_text= rdr.GetString(9);
            int opt_2_health = rdr.GetInt32(10);
            int opt_2_money = rdr.GetInt32(11);
            int opt_2_mood = rdr.GetInt32(12);
            string opt_3_choice_text= rdr.GetString(13);
            string opt_3_result_text= rdr.GetString(14);
            int opt_3_health = rdr.GetInt32(15);
            int opt_3_money = rdr.GetInt32(16);
            int opt_3_mood = rdr.GetInt32(17);

            Scenario newScenario = new Scenario(id, scenario_name, prompt_text, opt_1_choice_text, opt_1_result_text, opt_1_health, opt_1_money, opt_1_mood, opt_2_choice_text, opt_2_result_text, opt_2_health, opt_2_money, opt_2_mood, opt_3_choice_text, opt_3_result_text, opt_3_health, opt_3_money, opt_3_mood);

            allScenarios.Add(newScenario);
          }

          conn.Close();
          if (conn != null)
          {
            conn.Dispose();
          }
          return allScenarios;
        }

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
          id = 0;
          string scenario_name = "";
          string prompt_text = "";
          string opt_1_choice_text = "";
          string opt_1_result_text = "";
          int opt_1_health = 0;
          int opt_1_money = 0;
          int opt_1_mood = 0;
          string opt_2_choice_text= "";
          string opt_2_result_text= "";
          int opt_2_health = 0;
          int opt_2_money = 0;
          int opt_2_mood = 0;
          string opt_3_choice_text= "";
          string opt_3_result_text= "";
          int opt_3_health = 0;
          int opt_3_money = 0;
          int opt_3_mood = 0;

          while(rdr.Read())
          {
            id = rdr.GetInt32(0);
            scenario_name = rdr.GetString(1);
            prompt_text = rdr.GetString(2);
            opt_1_choice_text = rdr.GetString(3);
            opt_1_result_text = rdr.GetString(4);
            opt_1_health = rdr.GetInt32(5);
            opt_1_money = rdr.GetInt32(6);
            opt_1_mood = rdr.GetInt32(7);
            opt_2_choice_text= rdr.GetString(8);
            opt_2_result_text= rdr.GetString(9);
            opt_2_health = rdr.GetInt32(10);
            opt_2_money = rdr.GetInt32(11);
            opt_2_mood = rdr.GetInt32(12);
            opt_3_choice_text= rdr.GetString(13);
            opt_3_result_text= rdr.GetString(14);
            opt_3_health = rdr.GetInt32(15);
            opt_3_money = rdr.GetInt32(16);
            opt_3_mood = rdr.GetInt32(17);
          }

          // Constructor below no longer includes a itemCategoryId parameter:
          Scenario newScenario = new Scenario(id, scenario_name, prompt_text, opt_1_choice_text, opt_1_result_text, opt_1_health, opt_1_money, opt_1_mood, opt_2_choice_text, opt_2_result_text, opt_2_health, opt_2_money, opt_2_mood, opt_3_choice_text, opt_3_result_text, opt_3_health, opt_3_money, opt_3_mood);
          conn.Close();
          if (conn != null)
          {
              conn.Dispose();
          }

          return newScenario;
        }
      }
    }
