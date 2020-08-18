class Modifiers {

  final int id;
  final String name;
  final String price;
  final String description;
  final int userId;
  final int companyId;
  final String delStatus;

  Modifiers({this.id, this.name, this.price, this.description,
      this.userId, this.companyId, this.delStatus});

  Modifiers.fromJson(Map<String, dynamic> json)
  :
    id = int.parse(json['id']),
    name = json['name'],
    price = json['price'],
    description = json['description'],
    userId = int.parse(json['user_id']),
    companyId = int.parse(json['company_id']),
    delStatus = json['del_status'];

  @override
  String toString() {
    return 'Modifiers{id: $id, name: $name, price: $price, description: $description, userId: $userId, companyId: $companyId, delStatus: $delStatus}';
  }
}