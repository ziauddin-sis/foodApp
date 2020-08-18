class Categories {

  final int id;
  final String categoryName;
  final String description;
  final int userId;
  final int companyId;
  final String delStatus;

  Categories({this.id, this.categoryName, this.description,
      this.userId, this.companyId, this.delStatus});

  Categories.fromJson(Map<String, dynamic> json)
  :
    id = int.parse(json['id']),
    categoryName = json['category_name'],
    description = json['description'],
    userId = int.parse(json['user_id']),
    companyId = int.parse(json['company_id']),
    delStatus = json['del_status'];

  @override
  String toString() {
    return 'Categories{id: $id, categoryName: $categoryName, description: $description, userId: $userId, companyId: $companyId, delStatus: $delStatus}';
  }
}