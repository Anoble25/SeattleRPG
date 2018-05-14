using System.Collections.Generic;
using MySql.Data.MySqlClient;
using System;

namespace SeattleRPG.Models
{
  public class Player
  {
    private string _name;
    private string _status;
    private int _health;
    private int _mood;
    private int _money;
    private int id;

    public Player(string Name, string socialStatus, int Health, int Mood, int Money, int id = 0)
    {
      _name = Name;
      _status = socialStatus;
      _health = Health;
      _mood = Mood;
      _money = Money;
      id = id;
    }
    public string GetName()
    {
      return _name;
    }
    public string GetStatus()
    {
      return _status;
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

  }
}
