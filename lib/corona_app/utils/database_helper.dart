import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:re_exam_corona/corona_app/model/corona_model.dart';
import 'package:re_exam_corona/corona_app/model/db_model.dart';
import 'package:sqflite/sqflite.dart';


class DB_Helper {

  static DB_Helper db_helper = DB_Helper();

  Database? database;

  String dbName = "contre";
  String tName = "contreTable";

  Future<Database?> checkDB() async {
    if (database != null)
    {
      return database;
    }
    else{
      return await initDB();
    }
  }

  Future<Database> initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, dbName);

    String query =
        "CREATE TABLE $tName (id INTEGER PRIMARY KEY AUTOINCREMENT , name TEXT ,flag TEXT ,cases TEXT";

    return await openDatabase(path,
      version: 1,
      onCreate: (db, version) async {
        return await db.execute(query);
      },);
  }

  Future<void> insertDB(DBModel userModel)
  async {
    database = await checkDB();
    database?.insert(tName, {
      'name' : userModel.name,
      'flag': userModel.flag,
      'cases': userModel.cases,
    });
  }

  Future<List<Map>> redDB() async {
    database = await checkDB();
    String query = "SELECT * FROM $tName";
    List<Map> list = await database!.rawQuery(query);
    return list;
  }
}