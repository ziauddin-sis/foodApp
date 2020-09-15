import 'package:food_app/model/mdl_item_menus.dart';

class CartList {
  List<ItemMenus> _list = [];

  CartList._();
  static final CartList _instance = CartList._();
  static CartList get instance => _instance;

  List<ItemMenus> get list => _list;

  void addItem(ItemMenus f) {
    _list.add(f);
  }

  String listLength() {
    return _list.length.toString();
  }

  @override
  String toString() {
    return 'CartList{_list: $_list}';
  }
}
