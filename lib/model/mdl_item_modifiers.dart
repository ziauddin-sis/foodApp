class ItemModifiers {

  final int id;
  final int modifierId;
  final int foodMenuId;
  final int userId;
  final int outletId;
  final int companyId;
  final String delStatus;
  final String name;
  final String price;


  ItemModifiers({this.id, this.modifierId, this.foodMenuId, this.userId,
      this.outletId, this.companyId, this.delStatus, this.name, this.price});

  ItemModifiers.fromJson(Map<String, dynamic> json)
  :
    id = int.parse(json['id']),
    modifierId = int.parse(json['modifier_id']),
    foodMenuId = int.parse(json['food_menu_id']),
    userId = int.parse(json['user_id']),
    outletId = json['outlet_id'] == null ? 0 : int.parse(json['outlet_id']),
    companyId = int.parse(json['company_id']),
    name = json['name'],
    price = json['price'],
    delStatus = json['del_status'];

  @override
  String toString() {
    return 'ItemModifiers{id: $id, modifierId: $modifierId, foodMenuId: $foodMenuId, userId: $userId, outletId: $outletId, companyId: $companyId, delStatus: $delStatus, name: $name, price: $price}';
  }
}