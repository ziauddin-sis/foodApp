class Tables {

  final int id;
  final String name;
  final String sitCapacity;
  final String position;
  final String description;
  final int userId;
  final int outletId;
  final int companyId;
  final String delStatus;

  Tables({this.id, this.name, this.sitCapacity, this.position, this.description,
      this.userId, this.outletId, this.companyId, this.delStatus});

  Tables.fromJson(Map<String, dynamic> json)
  :
    id = int.parse(json['id']),
    name = json['name'],
    sitCapacity = json['sit_capacity'],
    position = json['position'],
    description = json['description'],
    userId = int.parse(json['user_id']),
    outletId = int.parse(json['outlet_id']),
    companyId = int.parse(json['company_id']),
    delStatus = json['del_status'];

  @override
  String toString() {
    return 'Tables{id: $id, name: $name, sitCapacity: $sitCapacity, position: $position, description: $description, userId: $userId, outletId: $outletId, companyId: $companyId, delStatus: $delStatus}';
  }
}