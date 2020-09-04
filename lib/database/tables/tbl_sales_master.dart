import 'package:food_app/database/db_main.dart';

class TblSalesMaster{

  static final tableName = 'sales_master';

  final mainDBHelper = MainDBHelper.instance;

  TblSalesMaster._pvtConst();
  static final TblSalesMaster salesMasterInstance = TblSalesMaster._pvtConst();

  static final id = 'id';
  static final customerId = 'customer_id';
  static final saleNo = 'sale_no';
  static final totalItems = 'total_items';
  static final subTotal = 'sub_total';
  static final paidAmount = 'paid_amount';
  static final dueAmount = 'due_amount';
  static final disc = 'disc';
  static final discActual = 'disc_actual';
  static final vat = 'vat';
  static final totalPayable = 'total_payable';
  static final paymentMethodId = 'payment_method_id';
  static final closeTime = 'close_time';
  static final tableId = 'table_id';
  static final totalItemDiscountAmount = 'total_item_discount_amount';
  static final subTotalWithDiscount = 'sub_total_with_discount';
  static final subTotalDiscountAmount = 'sub_total_discount_amount';
  static final totalDiscountAmount = 'total_discount_amount';
  static final deliveryCharge = 'delivery_charge';
  static final subTotalDiscountValue = 'sub_total_discount_value';
  static final subTotalDiscountType = 'sub_total_discount_type';
  static final saleDate = 'sale_date';
  static final dateTime = 'date_time';
  static final orderTime = 'order_time';
  static final cookingStartTime = 'cooking_start_time';
  static final cookingDoneTime = 'cooking_done_time';
  static final modified = 'modified';
  static final userId = 'user_id';
  static final waiterId = 'waiter_id';
  static final outletId = 'outlet_id';
  static final orderStatus = 'order_status';
  static final orderType = 'order_type';
  static final delStatus = 'del_status';
  static final saleVatObjects = 'sale_vat_objects';
  static final deviceKey = 'device_key';
  static final remoteId = 'remote_id';
  static final companyId = 'company_id';

}