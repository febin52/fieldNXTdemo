import 'package:fieldnxtdemo/data/models/profile_model.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';

class SqlHelper {
  static Future<void> createTable(sql.Database database) async {
    await database.execute(
        """CREATE TABLE items(id TEXT PRIMARY KEY,token TEXT,tokenExpires TEXT,firstName TEXT,lastName TEXT,contactNo TEXT,empCode TEXT,role TEXT,createDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)""");
  }

  static Future<sql.Database> db() async {
    String path = join(await getDatabasesPath(), 'myitems.db');
    return sql.openDatabase(path, version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTable(database);
    });
  }

  static Future<int> createItem(ProfileModel userData) async {
    final db = await SqlHelper.db();
    db.delete('items');
    final data = userData.toJson();
    final id = await db.insert('items', data);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SqlHelper.db();
    return db.query('items');
  }

  static Future<int> deleteItem(int id) async {
    final db = await SqlHelper.db();
    return db.delete('items', where: "id = ?", whereArgs: [id]);
  }
}
