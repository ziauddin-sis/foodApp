import 'package:sqflite/sqflite.dart';

import '../db_main.dart';

class TblCustomers{

  static final tableName = 'customers';

  static final id = 'id';
  static final name = 'name';
  static final phone = 'phone';
  static final email = 'email';
  static final address = 'address';
  static final gstNumber = 'gst_number';
  static final areaId = 'area_id';
  static final userId = 'user_id';
  static final companyId = 'company_id';
  static final delStatus = 'del_status';
  static final dateOfBirth = 'date_of_birth';
  static final dateOfAnniversary = 'date_of_anniversary';

  final mainDbHelper = MainDBHelper.instance;

  TblCustomers._pvtConst();
  static final TblCustomers customersInstance = TblCustomers._pvtConst();

  static final String tblCustomers = '''CREATE TABLE $tableName(
  $id INTEGER,
  $name TEXT,
  $phone TEXT,
  $email TEXT,
  $address TEXT,
  $gstNumber TEXT,
  $areaId INTEGER,
  $userId INTEGER,
  $companyId INTEGER,
  $delStatus TEXT,
  $dateOfBirth TEXT,
  $dateOfAnniversary TEXT
  )''';

  Future<int> insertCustomer(Map<String, dynamic> row) async {
    Database db = await mainDbHelper.database;
    print('Database: $db');
    return await db.insert(tableName, row);
  }

  Future<List<Map<String, dynamic>>> getCustomer() async {
    Database db = await mainDbHelper.database;
    return await db.query(tableName);
  }
}