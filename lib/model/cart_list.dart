import 'package:food_app/model/food_item.dart';

class CartList{

  List<FoodItem> _list = [];

  CartList._();
  static final CartList _instance = CartList._();
  static CartList get instance => _instance;

  List<FoodItem> get list => _list;

  void addItem(FoodItem f){
    _list.add(f);
  }

  String listLength(){
    return _list.length.toString();
  }

  @override
  String toString() {
    return 'CartList{_list: $_list}';
  }
}