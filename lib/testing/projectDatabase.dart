import 'dart:async';
import 'package:logger/logger.dart';
import 'package:food_app/shared/config.dart';
import 'package:food_app/testing/table.dart' as T;
import 'package:food_app/testing/tables.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class ProjectDatabase {
  static const String databaseName = Config.DATABASE_NAME;
  static int crntVersion;
  static const int newVersion = Config.DATABASE_VERSION;
  static Database _database;
  static Logger _log = Config.log;

  Future<Database> get database async {
    if (_database != null) {
      crntVersion = await _database.getVersion();
      return _database;
    } else {
      return _initDatabase();
    }
  }

  Future<Database> _initDatabase() async {
    String databaseLocation = await getDatabasesPath();
    String path = join(databaseLocation, Config.DATABASE_NAME);
    _database = await openDatabase(path);
    crntVersion = await _database.getVersion();
    openDatabase(path,
        onCreate: onCreate(_database, newVersion),
        onUpgrade: onUpgrade(_database, newVersion, crntVersion),
        onDowngrade: onDowngrade(_database, newVersion, crntVersion));
    return _database;
  }

  static bool isNull = true;
  static List<T.Table> tablesList = Tables.getTables();

  void create(Database db) {
    _log.v('CREATING DATABASE');
    tablesList.forEach((table) => table.create(db));
  }

  void truncate(Database db) {
    tablesList.forEach((table) => table.delete(db));
  }

  FutureOr<void> onCreate(Database db, int version) {
    if (version == 0) {
      tablesList.forEach((table) => table.create(db));
    }
  }

  FutureOr<void> onUpgrade(Database db, int oldVersion, int newVersion) {
    // ADD UPGRADE INSTRUCTIONS HERE
    if (oldVersion < newVersion) {
      tablesList.forEach((table) => table.drop(db));
      tablesList.forEach((table) => table.create(db));
    }
  }

  FutureOr<void> onDowngrade(Database db, int oldVersion, int newVersion) {
    // ADD DOWNGRAGE INSTRUCTIONS HERE IF ANY
    if (oldVersion > newVersion) {
      tablesList.forEach((table) => table.drop(db));
      tablesList.forEach((table) => table.create(db));
    }
  }
}
