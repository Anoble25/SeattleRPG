using System.Collections.Generic;
using MySql.Data.MySqlClient;
using System;

namespace SeattleRPG.Models
{
  public class Player
  {
    private string _name;
    private int _health;
    private int _mood;
    private int _money;
    private int _id;

    public Player(string Name, int Health=100, int Mood=100, int Money=1000, int id = 0)
    {
      _name = Name;
      _health = Health;
      _mood = Mood;
      _money = Money;
      _id = id;
    }
    public string GetName()
    {
      return _name;
    }

    public int GetHealth()
    {
      return _health;
    }
    public int GetMood()
    {
      return _mood;
    }
    public int GetMoney()
    {
      return _money;
    }
    public int GetId()
    {
      return _id;
    }


    public static List<Player> GetAllPlayers()
    {
      List<Player> allPlayers = new List<Player> {};
      MySqlConnection conn = DB.Connection();
      conn.Open();
      var cmd = conn.CreateCommand() as MySqlCommand;
      cmd.CommandText = @"SELECT * FROM current_player;";
      var rdr = cmd.ExecuteReader() as MySqlDataReader;
      while(rdr.Read())
      {
        int playerId = rdr.GetInt32(0);
        string playerName = rdr.GetString(1);
        int playerHealth = rdr.GetInt32(2);
        int playerMood = rdr.GetInt32(3);
        int playerMoney = rdr.GetInt32(4);
        Player newPlayer = new Player(playerName, playerHealth, playerMood, playerMoney, playerId);
        allPlayers.Add(newPlayer);
      }
      conn.Close();
      if (conn != null)
      {
        conn.Dispose();
      }
      return allPlayers;
    }
    // public void Save()
    // {
    //   MySqlConnection conn = DB.Connection();
    //   conn.Open();
    //   var cmd = conn.CreateCommand() as MySqlCommand;
    //   cmd.CommandText = @"INSERT INTO players (name, health, mood, money) VALUES (@thisPlayerName, @thisPlayerHealth, @thisPlayerMood, @thisPlayerMoney);";
    //   cmd.Parameters.Add(new MySqlParameter("@thisPlayerName", _name));
    //   // cmd.Parameters.Add(new MySqlParameter("@thisPlayerHealth", _health));
    //   // cmd.Parameters.Add(new MySqlParameter("@thisPlayerMood", _mood);
    //   // cmd.Parameters.Add(new MySqlParameter("@thisPlayerMoney", _money));
    //
    //   cmd.ExecuteNonQuery();
    //   _id = (int) cmd.LastInsertedId;
    //
    //   conn.Close();
    //   if (conn != null)
    //   {
    //     conn.Dispose();
    //   }
    // }
    // public static Player Find(int id)
    // {
    //   MySqlConnection conn = DB.Connection();
    //   conn.Open();
    //   var cmd = conn.CreateCommand() as MySqlCommand();
    //   cmd.CommandText = @"SELECT * FROM players WHERE id = (@searchId);";
    //
    //   cmd.Parameters.Add(new MySqlParameter("@searchId", id));
    //
    //   var rdr = cmd.ExecuteReader() as MySqlDataReader;
    //   int playerId = 0;
    //   string playerName = "";
    //   int playerHealth = 0;
    //   int playerMood = 0;
    //   int playerMoney = 0;
    //
    //   while(rdr.Read())
    //   {
    //     playerId = rdr.GetInt32(0);
    //     playerName = rdr.GetString(1);
    //     playerHealth = rdr.GetInt32(2);
    //     playerMood = rdr.GetInt32(3);
    //     playerMoney = rdr.GetInt32(4);
    //   }
    //   Player newPlayer = new Player(playerName, playerHealth, playerMood, playerMoney, playerId);
    //   conn.Close();
    //   if (conn != null)
    //   {
    //     conn.Dispose();
    //   }
    //   return newPlayer;
    // }
    public void UpdatePlayerProperties(string newName, int newHealth, int newMood, int newMoney)
    {
      MySqlConnection conn = DB.Connection();
      conn.Open();
      var cmd = conn.CreateCommand() as MySqlCommand;
      cmd.CommandText = @"UPDATE current_player SET name = @newName, health = @newHealth, mood = @newMood, money = @newMoney WHERE id = @searchId;";

      cmd.Parameters.Add(new MySqlParameter("@searchId", _id));
      cmd.Parameters.Add(new MySqlParameter("@newName", newName));
      cmd.Parameters.Add(new MySqlParameter("@newHealth", newHealth));
      cmd.Parameters.Add(new MySqlParameter("@newMood", newMood));
      cmd.Parameters.Add(new MySqlParameter("@newMoney", newMoney));

      cmd.ExecuteNonQuery();
      _name = newName;
      _health = newHealth;
      _mood = newMood;
      _money = newMoney;
      conn.Close();
      if (conn != null)
      {
        conn.Dispose();
      }
    }

    public override bool Equals(System.Object otherPlayer)
    {
      if (!(otherPlayer is Player))
      {
        return false;
      }
      else
      {
        Player newPlayer = (Player) otherPlayer;
        bool idEquality = this.GetId() == newPlayer.GetId();
        bool nameEquality = this.GetName() == newPlayer.GetName();
        bool healthEquality = this.GetHealth() == newPlayer.GetHealth();
        bool moodEquality = this.GetMood() == newPlayer.GetMood();
        bool moneyEquality = this.GetMoney() == newPlayer.GetMoney();

        return (idEquality && nameEquality && healthEquality && moodEquality && moneyEquality);
      }
    }
    public override int GetHashCode()
    {
      return this.GetName().GetHashCode();
    }
  }
}
