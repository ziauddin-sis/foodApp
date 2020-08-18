import 'package:sqflite/sqflite.dart';
import '../db_main.dart';

class TblOutlet{

  //Table Name
  static final tableName = "outlet";

  //Columns Name
  static final id = "id";
  static final outletName = "outlet_name";
  static final outletCode = "outlet_code";
  static final address = "address";
  static final phone = "phone";
  static final invoicePrint = "invoice_print";
  static final startingDate = "starting_date";
  static final invoiceFooter = "invoice_footer";
  static final collectTax = "collect_tax";
  static final preOrPostOrder = "pre_or_post_payment";
  static final userId = "user_id";
  static final companyId = "company_id";
  static final delStatus = "del_status";

  final mainDbHelper = MainDBHelper.instance;

  TblOutlet._pvtConst();
  static final TblOutlet outletInstance = TblOutlet._pvtConst();

  static final String tblOutlet = '''
  CREATE TABLE $tableName(
  $id INTEGER,
  $outletName TEXT,
  $outletCode TEXT,
  $address TEXT,
  $phone TEXT,
  $invoicePrint TEXT,
  $startingDate TEXT,
  $invoiceFooter TEXT,
  $collectTax TEXT,
  $preOrPostOrder TEXT,
  $userId INTEGER,
  $companyId INTEGER,
  $delStatus TEXT
  )''';

  Future<int> insertOutlet(Map<String, dynamic> row) async {
    Database db = await mainDbHelper.database;
    print('Database: $db');
    return await db.insert(tableName, row);
  }

  Future<List<Map<String, dynamic>>> getOutlets() async {
    Database db = await mainDbHelper.database;
    return await db.query(tableName);
  }
}