import 'package:sqflite/sqflite.dart';

import '../db_main.dart';

class TblUsers{

  static final tableName = 'users';

  static final id = 'id';
  static final fullName = 'full_name';
  static final phone = 'phone';
  static final emailAddress = 'email_address';
  static final password = 'password';
  static final designation = 'designation';
  static final willLogin = 'will_login';
  static final role = 'role';
  static final outletId = 'outlet_id';
  static final companyId = 'company_id';
  static final accountCreationDate = 'account_creation_date';
  static final language = 'language';
  static final lastLogin = 'last_login';
  static final activeStatus = 'active_status';
  static final delStatus = 'del_status';

  final mainDbHelper = MainDBHelper.instance;

  TblUsers._pvtConst();
  static final TblUsers usersInstance = TblUsers._pvtConst();

  static final String tblUsers = '''CREATE TABLE $tableName(
  $id INTEGER,
  $fullName TEXT,
  $phone TEXT,
  $emailAddress TEXT,
  $password TEXT,
  $designation TEXT,
  $willLogin TEXT,
  $role TEXT,
  $outletId INTEGER,
  $companyId INTEGER,
  $accountCreationDate TEXT,
  $language TEXT,
  $lastLogin TEXT,
  $activeStatus TEXT,
  $delStatus TEXT
  )''';

  Future<int> insertUser(Map<String, dynamic> row) async {
    Database db = await mainDbHelper.database;
    print('Database: $db');
    return await db.insert(tableName, row);
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    Database db = await mainDbHelper.database;
    return await db.query(tableName);
  }
}