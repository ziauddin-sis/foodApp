import 'package:logger/logger.dart';
import 'package:food_app/shared/config.dart';
import 'package:food_app/testing/tables.dart';
import 'package:sqflite/sqlite_api.dart';

class Table {
  final String name;
  final List<String> columnNames;
  final List<String> columnTypes;
  final Database db;
  static Logger _log = Config.log;

  const Table({this.name, this.columnNames, this.columnTypes, this.db});

  void create() async {
    await db.execute(getCreateTableQuery());
    _log.i('TABLE $name CREATED');
  }

  void drop() async {
    db.execute(getDropTableQuery());
    _log.i('TABLE $name DROPED');
  }

  void delete() async {
    await db.delete(name);
    _log.i('TABLE $name DELETED');
  }

  List<String> getTablesList() {
    return Tables.tables;
  }

  Future<List<Map<String, dynamic>>> getData(String query) async {
    return await db.rawQuery(query);
  }

  String getCreateTableQuery() {
    String query = 'CREATE TABLE $name (';
    for (int i = 0; i < columnNames.length; i++) {
      query += '${columnNames[i]}, ${columnTypes[i]},';
    }
    query += ');';
    return query;
  }

  String getDropTableQuery() {
    return 'DROP TABLE IF EXISTS ${this.name}';
  }
}
