import 'package:food_app/database/db_main.dart';
import 'package:sqflite/sqflite.dart';

class TblTables {
  static final tableName = 'tables';

  final mainDbHelper = MainDBHelper.instance;

  TblTables._pvtConst();
  static final TblTables tablesInstance = TblTables._pvtConst();

  static final id = 'id';
  static final name = 'name';
  static final sitCapacity = 'sit_capacity';
  static final position = 'position';
  static final description = 'description';
  static final userId = 'user_id';
  static final outletId = 'outlet_id';
  static final companyId = 'company_id';
  static final delStatus = 'del_status';

  static final String tblTables = '''
  CREATE TABLE $tableName(
  $id INTEGER,
  $name TEXT,
  $sitCapacity TEXT,
  $position TEXT,
  $description TEXT,
  $userId INTEGER,
  $outletId INTEGER,
  $companyId INTEGER,
  $delStatus TEXT
  )
  ''';

  Future<int> insertTable(Map<String, dynamic> table) async {
    Database db = await mainDbHelper.database;
    return await db.insert(tableName, table);
  }

  Future<List<Map<String, dynamic>>> getTables() async {
    Database db = await mainDbHelper.database;
    return await db.query(tableName);
  }
}
