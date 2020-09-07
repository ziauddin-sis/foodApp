import 'dart:convert';

class SalesMaster{

 int id;
 int customerId;
 String saleNo;
 String totalItems;
 String subTotal;
 String paidAmount;
 String dueAmount;
 String disc;
 String discActual;
 String vat;
 String totalPayable;
 int paymentMethodId;
 String closeTime;
 int tableId;
 String totalItemDiscountAmount;
 String subTotalWithDiscount;
 String subTotalDiscountAmount;
 String totalDiscountAmount;
 String deliveryCharge;
 String subTotalDiscountValue;
 String subTotalDiscountType;
 String saleDate;
 String dateTime;
 String orderTime;
 String cookingStartTime;
 String cookingDoneTime;
 String modified;
 int userId;
 int waiterId;
 int outletId;
 int orderStatus;
 int orderType;
 String delStatus;
 String saleVatObjects;
 String deviceKey;
 int remoteId;
 int companyId;

 SalesMaster(
      {this.id,
      this.customerId,
      this.saleNo,
      this.totalItems,
      this.subTotal,
      this.paidAmount,
      this.dueAmount,
      this.disc,
      this.discActual,
      this.vat,
      this.totalPayable,
      this.paymentMethodId,
      this.closeTime,
      this.tableId,
      this.totalItemDiscountAmount,
      this.subTotalWithDiscount,
      this.subTotalDiscountAmount,
      this.totalDiscountAmount,
      this.deliveryCharge,
      this.subTotalDiscountValue,
      this.subTotalDiscountType,
      this.saleDate,
      this.dateTime,
      this.orderTime,
      this.cookingStartTime,
      this.cookingDoneTime,
      this.modified,
      this.userId,
      this.waiterId,
     this.outletId,
      this.orderStatus,
      this.orderType,
      this.delStatus,
      this.saleVatObjects,
      this.deviceKey,
      this.remoteId,
      this.companyId});

  SalesMaster.fromJson(Map<String, dynamic> json)
  :
  id = int.parse(json['id']),
 customerId = int.parse(json['customer_id']),
 saleNo = json['sale_no'],
 totalItems = json['total_items'],
 subTotal = json['sub_total'],
 paidAmount = json['paid_amount'],
 dueAmount = json['due_amount'],
 disc = json['disc'],
 discActual = json['disc_actual'],
 vat = json['vat'],
 totalPayable = json['total_payable'],
 paymentMethodId = int.parse(json['payment_method_id']),
 closeTime = json['close_time'],
 tableId = int.parse(json['table_id']),
 totalItemDiscountAmount = json['total_item_discount_amount'],
 subTotalWithDiscount = json['sub_total_with_discount'],
 subTotalDiscountAmount = json['sub_total_discount_amount'],
 totalDiscountAmount = json['total_discount_amount'],
 deliveryCharge = json['delivery_charge'],
 subTotalDiscountValue = json['sub_total_discount_value'],
 subTotalDiscountType = json['sub_total_discount_type'],
 saleDate = json['sale_date'],
 dateTime = json['date_time'],
 orderTime = json['order_time'],
 cookingStartTime = json['cooking_start_time'],
 cookingDoneTime = json['cooking_done_time'],
 modified = json['modified'],
 userId = int.parse(json['user_id']),
 waiterId = int.parse(json['waiter_id']),
 outletId = int.parse(json['outlet_id']),
 orderStatus = int.parse(json['order_status']),
 orderType = int.parse(json['order_type']),
 delStatus = json['del_status'],
 saleVatObjects = json['sale_vat_objects'],
 deviceKey = json['device_key'],
 remoteId = int.parse(json['remote_id']),
 companyId = int.parse(json['company_id']);

 @override
  String toString() {
    return 'SalesMaster{id: $id, customerId: $customerId, saleNo: $saleNo, totalItems: $totalItems, subTotal: $subTotal, paidAmount: $paidAmount, dueAmount: $dueAmount, disc: $disc, discActual: $discActual, vat: $vat, totalPayable: $totalPayable, paymentMethodId: $paymentMethodId, closeTime: $closeTime, tableId: $tableId, totalItemDiscountAmount: $totalItemDiscountAmount, subTotalWithDiscount: $subTotalWithDiscount, subTotalDiscountAmount: $subTotalDiscountAmount, totalDiscountAmount: $totalDiscountAmount, deliveryCharge: $deliveryCharge, subTotalDiscountValue: $subTotalDiscountValue, subTotalDiscountType: $subTotalDiscountType, saleDate: $saleDate, dateTime: $dateTime, orderTime: $orderTime, cookingStartTime: $cookingStartTime, cookingDoneTime: $cookingDoneTime, modified: $modified, userId: $userId, waiterId: $waiterId, outletId: $outletId, orderStatus: $orderStatus, orderType: $orderType, delStatus: $delStatus, saleVatObjects: $saleVatObjects, deviceKey: $deviceKey, remoteId: $remoteId, companyId: $companyId}';
 }
}

