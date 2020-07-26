class FoodItem{

  String _img, _name, _detail;
  int _price, _gst, _quantity;

  FoodItem();

  FoodItem.name(
      this._img,
      this._name,
      this._detail,
      this._price,
      this._gst,
      this._quantity);
  //  FoodItem(this._img, this._name, this._detail, this._price, this._quantity, this._gst);



  set quantity(value) {
    _quantity = value;
  }

  get quantity => _quantity;

  get gst => _gst;

  int get price => _price;

  get detail => _detail;

  get name => _name;

  String get img => _img;
}
