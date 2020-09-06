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

 
}