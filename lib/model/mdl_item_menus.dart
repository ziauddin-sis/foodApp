class ItemMenus {

   int id;
   String code;
   String name;
   String salePrice;
   String photo;
   String categoryName;
   String percentage;
   int quantity;

  ItemMenus({this.id, this.code, this.name, this.salePrice, this.photo,
      this.categoryName, this.percentage, this.quantity});

  ItemMenus.fromJson(Map<String, dynamic> json)
  :
    id = int.parse(json['id']),
    code = json['code'],
    name = json['name'],
    salePrice = json['sale_price'],
    photo = json['photo'],
    categoryName = json['category_name'],
    percentage = json['percentage'];

  @override
  String toString() {
    return 'ItemMenus{id: $id, code: $code, name: $name, salePrice: $salePrice, photo: $photo, categoryName: $categoryName, percentage: $percentage}';
  }


}