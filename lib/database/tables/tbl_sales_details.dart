import 'package:food_app/database/db_main.dart';
import 'package:food_app/model/mdl_sales_details.dart';
import 'package:sqflite/sqflite.dart';

class TblSalesDetails{

  static final tableName = 'sales_details';

  final mainDBHelper = MainDBHelper.instance;

  TblSalesDetails._pvtConst();
  static final TblSalesDetails salesMasterInstance = TblSalesDetails._pvtConst();

  static final id = 'id';
  static final foodMenuId = 'food_menu_id';
  static final menuName = 'menu_name';
  static final qty = 'qty';
  static final menuPriceWithoutDiscount = 'menu_price_without_discount';
  static final menuPriceWithDiscount = 'menu_price_with_discount';
  static final menuUnitPrice = 'menu_unit_price';
  static final menuVatPercentage = 'menu_vat_percentage';
  static final menuTaxes = 'menu_taxes';
  static final menuDiscountValue = 'menu_discount_value';
  static final discountType = 'discount_type';
  static final menuNote = 'menu_note';
  static final discountAmount = 'discount_amount';
  static final itemType = 'item_type';
  static final cookingStatus = 'cooking_status';
  static final cookingStartTime = 'cooking_start_time';
  static final cookingDoneTime = 'cooking_done_time';
  static final previousId = 'previous_id';
  static final salesMasterId = 'sales_id';
  static final orderStatus = 'order_status';
  static final userId = 'user_id';
  static final outletId = 'outlet_id';
  static final delStatus = 'del_status';

  static final String tblSalesMaster = '''
  CREATE TABLE $tableName(
  $id INTEGER PRIMARY KEY,
  $foodMenuId INTEGER,
  $menuName TEXT,
  $qty INTEGER,
  $menuPriceWithoutDiscount TEXT,
  $menuPriceWithDiscount TEXT,
  $menuUnitPrice TEXT,
  $menuVatPercentage TEXT,
  $menuTaxes TEXT,
  $menuDiscountValue TEXT,
  $discountType TEXT,
  $menuNote INTEGER,
  $discountAmount TEXT,
  $itemType TEXT,
  $cookingStatus TEXT,
  $cookingStatus TEXT,
  $cookingStartTime TEXT,
  $cookingDoneTime TEXT,
  $previousId INTEGER,
  $salesMasterId INTEGER,
  $orderStatus INTEGER,
  $userId INTEGER,
  $outletId INTEGER,
  $delStatus TEXT,
  )
  ''';

  Future<int> insertInSaleDetails(SalesDetails salesDetails) async {
    Database db = await mainDBHelper.database;
    var res = await db.rawInsert('INSERT INTO $tableName ($foodMenuId, $menuName, $qty,'
        '$menuPriceWithoutDiscount, $menuPriceWithDiscount, $menuUnitPrice, $menuVatPercentage,'
        '$menuTaxes, $cookingStartTime, $cookingDoneTime, $salesMasterId) VALUES (${salesDetails.foodMenuId},'
        '${salesDetails.menuName}, ${salesDetails.qty}, ${salesDetails.menuPriceWithoutDiscount}, ${salesDetails.menuPriceWithDiscount},'
        '${salesDetails.menuUnitPrice}, ${salesDetails.menuVatPercentage}, ${salesDetails.menuTaxes}, ${salesDetails.cookingStartTime},'
        '${salesDetails.cookingDoneTime}, ${salesDetails.salesMasterId})');
    return res;
  }

  Future<List<Map<String, dynamic>>> getSaleDetails() async {
    Database db = await mainDBHelper.database;
    return await db.query(tableName);
  }

}