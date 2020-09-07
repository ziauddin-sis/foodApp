class SalesDetails{

 int id;
 int foodMenuId;
 String menuName;
 int qty;
 String menuPriceWithoutDiscount;
 String menuPriceWithDiscount;
 String menuUnitPrice;
 String menuVatPercentage;
 String menuTaxes;
 String menuDiscountValue;
 String discountType;
 String menuNote;
 String discountAmount;
 String itemType;
 String cookingStatus;
 String cookingStartTime;
 String cookingDoneTime;
 int previousId;
 int salesMasterId;
 int orderStatus;
 int userId;
 int outletId;
 String delStatus;

 SalesDetails({this.id, this.foodMenuId, this.menuName, this.qty,
     this.menuPriceWithoutDiscount, this.menuPriceWithDiscount,
     this.menuUnitPrice, this.menuVatPercentage, this.menuTaxes,
     this.menuDiscountValue, this.discountType, this.menuNote,
     this.discountAmount, this.itemType, this.cookingStatus,
     this.cookingStartTime, this.cookingDoneTime, this.previousId,
     this.salesMasterId, this.orderStatus, this.userId, this.outletId,
     this.delStatus});

 SalesDetails.fromJson(Map<String, dynamic> json)
 :
       id = int.parse(json['id']),
       foodMenuId = int.parse(json['food_menu_id']),
       menuName = json['menu_name'],
       qty = int.parse(json['qty']),
       menuPriceWithoutDiscount = json['menu_price_without_discount'],
       menuPriceWithDiscount = json['menu_price_with_discount'],
       menuUnitPrice = json['menu_unit_price'],
       menuVatPercentage = json['menu_vat_percentage'],
       menuTaxes = json['menu_taxes'],
       menuDiscountValue = json['menu_discount_value'],
       discountType = json['discount_type'],
       menuNote = json['menu_note'],
       discountAmount = json['discount_amount'],
       itemType = json['item_type'],
       cookingStatus = json['cooking_status'],
       cookingStartTime = json['cooking_start_time'],
       cookingDoneTime = json['cooking_done_time'],
       previousId = int.parse(json['previous_id']),
       salesMasterId = int.parse(json['sales_id']),
       orderStatus = int.parse(json['order_status']),
       userId = int.parse(json['user_id']),
       outletId = int.parse(json['outlet_id']),
       delStatus = json['del_status'];

 @override
  String toString() {
    return 'SalesDetails{id: $id, foodMenuId: $foodMenuId, menuName: $menuName, qty: $qty, menuPriceWithoutDiscount: $menuPriceWithoutDiscount, menuPriceWithDiscount: $menuPriceWithDiscount, menuUnitPrice: $menuUnitPrice, menuVatPercentage: $menuVatPercentage, menuTaxes: $menuTaxes, menuDiscountValue: $menuDiscountValue, discountType: $discountType, menuNote: $menuNote, discountAmount: $discountAmount, itemType: $itemType, cookingStatus: $cookingStatus, cookingStartTime: $cookingStartTime, cookingDoneTime: $cookingDoneTime, previousId: $previousId, salesMasterId: $salesMasterId, orderStatus: $orderStatus, userId: $userId, outletId: $outletId, delStatus: $delStatus}';
 }
}

