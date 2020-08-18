import 'package:food_app/database/db_main.dart';
import 'package:sqflite/sqflite.dart';

class TblCompany{

  //Table name
  static final tableName = "company";

  //Columns name of table2
  static final id = "id";
  static final currency = "currency";
  static final timezone = "timezone";
  static final dateFormat = "date_format";
  static final outletId = "outlet_id";
  static final name = "name";
  static final email  = "email";
  static final phone1  = "phone_1";
  static final phone2  = "phone_2";
  static final address  = "address";
  static final status  = "status";
  static final dateAdded  = "date_added";
  static final expiryDate  = "expiry_date";
  static final token  = "token";

  final mainDbHelper = MainDBHelper.instance;

  TblCompany._pvtConst();
  static final TblCompany instance = TblCompany._pvtConst();


  static final String tblCompany = '''CREATE TABLE $tableName(
    $id INTEGER,
    $currency TEXT,
    $timezone TEXT,
    $dateFormat TEXT,
    $outletId INTEGER,
    $name TEXT,
    $email TEXT,
    $phone1 TEXT,
    $phone2 TEXT,
    $address TEXT,
    $status TEXT,
    $dateAdded TEXT,
    $expiryDate TEXT,
    $token TEXT 
     )''';

  Future<int> insertCompany(Map<String, dynamic> row) async {
    Database db = await mainDbHelper.database;
    print('Database: $db');
    return await db.insert(tableName, row);
  }

  Future<List<Map<String, dynamic>>> getCompanies() async {
    Database db = await mainDbHelper.database;
    return await db.query(tableName);
  }

}