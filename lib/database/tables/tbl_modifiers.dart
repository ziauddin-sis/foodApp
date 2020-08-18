import 'package:sqflite/sqflite.dart';
import '../db_main.dart';

class TblModifiers{

  static final tableName = 'modifiers';

  final mainDbHelper = MainDBHelper.instance;

  TblModifiers._pvtConst();
  static final TblModifiers modifiersInstance = TblModifiers._pvtConst();

  static final id = 'id';
  static final name = 'name';
  static final price = 'price';
  static final description = 'description';
  static final userId = 'user_id';
  static final companyId = 'company_id';
  static final delStatus = 'del_status';

  static final String tblModifiers = '''
  CREATE TABLE $tableName(
  $id INTEGER,
  $name TEXT,
  $price TEXT,
  $description TEXT,
  $userId INTEGER,
  $companyId INTEGER,
  $delStatus TEXT
  )
  ''';

  Future<int> insertModifiers (Map<String, dynamic> mod) async{
    Database db = await mainDbHelper.database;
    return await db.insert(tableName, mod);
  }

  Future<List<Map<String, dynamic>>> getModifiers() async {
    Database db = await mainDbHelper.database;
    return await db.query(tableName);
  }
}