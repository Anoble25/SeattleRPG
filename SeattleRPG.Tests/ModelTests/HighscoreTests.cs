using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;
using System;
using SeattleRPG.Models;
using SeattleRPG;
using MySql.Data.MySqlClient;

namespace SeattleRPG.Tests
{

  [TestClass]
  public class HighscoreTests : IDisposable
  {
    public HighscoreTests()
    {
      DBConfiguration.ConnectionString = "server=localhost;user id=root;password=root;port=8889;database=seattle_rpg;";
    }
    [TestMethod]
    public void Save_SavesItemToDatabase_Book()
    {
      Book testBook = new Book("Crime and Punishment", "Novel");
      testBook.Save();

      List<Book> result = Book.GetAllBooks();
      List<Book> testList = new List<Book>{testBook};

      CollectionAssert.AreEqual(result, testList);

    }
    [TestMethod]
    public void Save_DatabaseAssignsIdToObject_Id()
    {
      //Arrange
      Book testBook = new Book("Crime and Punishment", "Novel");
      testBook.Save();

      //Act
      Book savedBook = Book.GetAllBooks()[0];

      int result = savedBook.GetId();
      int testId = testBook.GetId();

      //Assert
      Assert.AreEqual(result, testId);
    }


  }
}
