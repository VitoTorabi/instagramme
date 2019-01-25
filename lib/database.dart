import 'dart:async';
import 'dart:io' as io;
import 'package:instagram_1/model/account.dart';
import 'package:instagram_1/model/comment.dart';
import 'package:instagram_1/model/post.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  //Creating a database with name test.dn in your directory
  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "test.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  // Creating a table name Employee with fields
  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE Employee(id INTEGER PRIMARY KEY, firstname TEXT, lastname TEXT, mobileno TEXT,emailId TEXT )");
    print("Created tables");
  }

  void insertAccount(Account account, int pass) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      return await txn.rawInsert(
          'INSERT INTO ACCOUNT(username, fullname, h_pass, bio, avatar) VALUES(' +
              '\'' +
              account.username +
              '\'' +
              ',' +
              '\'' +
              account.fullname +
              '\'' +
              ',' +
              '\'' +
              pass.hashCode.toString() +
              '\'' +
              ',' +
              '\'' +
              account.bio +
              '\'' +
              ',' +
              '\'' +
              account.avatar +
              '\'' +
              ')');
    });
  }

  void insertPost(Account account, Post post) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      return await txn.rawInsert(
          'INSERT into POST (uid, date, photo, caption) VALUES(' +
              '\'' +
              post.uid.toString() +
              '\'' +
              ',' +
              '\'' +
              post.time.toString() +
              '\'' +
              ',' +
              '\'' +
              post.photo +
              '\'' +
              ',' +
              '\'' +
              post.caption +
              '\'' +
              ')');
    });
  }

  void insertLike(Account account, Post post) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      return await txn.rawInsert('INSERT into LIKES (uid, pid) VALUES(' +
          '\'' +
          account.uid.toString() +
          '\'' +
          ',' +
          '\'' +
          post.pid.toString() +
          '\'' +
          ')');
    });
  }

  void insertSave(Account account, Post post) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      return await txn.rawInsert('INSERT into SAVES (uid, pid) VALUES(' +
          '\'' +
          account.uid.toString() +
          '\'' +
          ',' +
          '\'' +
          post.pid.toString() +
          '\'' +
          ')');
    });
  }

  void insertComment(Comment comment) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      return await txn.rawInsert(
          'INSERT into COMMENT (uid, pid, content) VALUES(' +
              '\'' +
              comment.uid.toString() +
              '\'' +
              ',' +
              '\'' +
              comment.pid.toString() +
              '\'' +
              ',' +
              '\'' +
              comment.content +
              '\'' +
              ')');
    });
  }

  void insertFOLLOWING(Account follower, Account followee) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      return await txn.rawInsert(
          'INSERT into FOLLOWING (follower, followee) VALUES(' +
              '\'' +
              follower.uid.toString() +
              '\'' +
              ',' +
              '\'' +
              followee.uid.toString() +
              '\'' +
              ')');
    });
  }
}
