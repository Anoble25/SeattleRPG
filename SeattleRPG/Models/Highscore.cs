using System.Collections.Generic;
using MySql.Data.MySqlClient;
using System;

namespace SeattleRPG.Models
{
  public class Highscore
  {
    private int _id;
    private string _playerName;
    private int _score;

    public Highscore(string name, int score, int id = 0)
    {
      _playerName = name;
      _score = score;
      _id = id;
    }
    public string GetPlayerName()
    {
      return _playerName;
    }
    public int GetId()
    {
      return _id;
    }
    public int GetScore()
    {
      return _score;
    }
    public static List<Highscore> GetAllScores()
    {
      List<Highscore> allHighscores = new List<Highscore> {};
      MySqlConnection conn = DB.Connection();
      conn.Open();
      var cmd = conn.CreateCommand() as MySqlCommand;
      cmd.CommandText = @"SELECT * FROM high_score;";
      var rdr = cmd.ExecuteReader() as MySqlDataReader;
      while(rdr.Read())
      {
        int scoreId = rdr.GetInt32(0);
        string playerName = rdr.GetString(1);
        int playerScore = rdr.GetInt32(2);

        Highscore newHighscore = new Highscore(playerName, playerScore, scoreId);
        allHighscores.Add(newHighscore);
      }
      conn.Close();
      if (conn != null)
      {
        conn.Dispose();
      }
      return allHighscores;
    }

    public void SaveScore()
    {
      MySqlConnection conn = DB.Connection();
      conn.Open();
      var cmd = conn.CreateCommand() as MySqlCommand;
      cmd.CommandText = @"INSERT INTO high_score (player_name, score) VALUES (@thisPlayerName, @thisPlayerMoney);";
      cmd.Parameters.Add(new MySqlParameter("@thisPlayerName", _playerName));
      cmd.Parameters.Add(new MySqlParameter("@thisPlayerMoney", _score));

      cmd.ExecuteNonQuery();
      _id = (int) cmd.LastInsertedId;

      conn.Close();
      if (conn != null)
      {
        conn.Dispose();
      }
    }

    public static List<Highscore> GetHighestScore()
    {
      List<Highscore> topHighscores = new List<Highscore> {};
      MySqlConnection conn = DB.Connection();
      conn.Open();
      var cmd = conn.CreateCommand() as MySqlCommand;
      cmd.CommandText = @"SELECT * FROM high_score ORDER BY score DESC LIMIT 5;";
      var rdr = cmd.ExecuteReader() as MySqlDataReader;
      while(rdr.Read())
      {
        int scoreId = rdr.GetInt32(0);
        string playerName = rdr.GetString(1);
        int playerScore = rdr.GetInt32(2);

        Highscore newHighscore = new Highscore(playerName, playerScore, scoreId);
        topHighscores.Add(newHighscore);
      }
      conn.Close();
      if (conn != null)
      {
        conn.Dispose();
      }
      return topHighscores;
    }

  }
}
