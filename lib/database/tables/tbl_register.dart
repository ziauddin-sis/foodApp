import 'package:food_app/database/db_main.dart';
import 'package:sqflite/sqflite.dart';

class TblRegister{

  static final tableName = 'register';

  final mainDBHelper = MainDBHelper.instance;

  TblRegister._pvtConst();
  static final TblRegister registerInstance = TblRegister._pvtConst();

  static final id = 'id';
  static final openingBalance = 'opening_balance';
  static final closingBalance = 'closing_balance';
  static final openingBalanceDateTime = 'opening_balance_date_time';
  static final closingBalanceDateTime = 'closing_balance_date_time';
  static final salePaidAmount = 'sale_paid_amount';
  static final customerDueReceive = 'customer_due_receive';
  static final paymentMethodsSale = 'payment_methods_sale';
  static final registerStatus = 'register_status';
  static final userId = 'user_id';
  static final outletId = 'outlet_id';
  static final companyId = 'company_id';
  static final registerNo = 'register_no';
  static final deviceKey = 'device_key';
  static final remoteId = 'remote_id';

  static final String tblRegister = '''
  CREATE TABLE $tableName(
  $id INTEGER PRIMARY KEY,
  $openingBalance TEXT,
  $closingBalance TEXT,
  $openingBalanceDateTime TEXT,
  $closingBalanceDateTime TEXT,
  $salePaidAmount TEXT,
  $customerDueReceive TEXT,
  $paymentMethodsSale TEXT,
  $registerStatus TEXT,
  $userId INTEGER,
  $outletId INTEGER,
  $companyId INTEGER,
  $registerNo TEXT,
  $deviceKey TEXT,
  $remoteId INTEGER
  )
  ''';

  Future<int> insertInRegister(ob, obd, ui) async {
    Database db = await mainDBHelper.database;
    var res = await db.rawInsert('INSERT INTO $tableName ($openingBalance,$openingBalanceDateTime,$userId) VALUES (?,?,?)', [ob, obd, ui]);
    return res;
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    Database db = await mainDBHelper.database;
    return await db.query(tableName);
  }

}