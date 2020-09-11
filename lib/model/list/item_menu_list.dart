import 'package:food_app/model/mdl_item_menus.dart';

class ItemMenuList{

  List<ItemMenus> _itmMenuLst = [];

  ItemMenuList._();
  static final ItemMenuList instanceItmMenuLst = ItemMenuList._();
  static ItemMenuList get instance => instanceItmMenuLst;

  void addItem(ItemMenus im){
    _itmMenuLst.add(im);
  }

  List<ItemMenus> get list => _itmMenuLst;

  @override
  String toString() {
    return 'ItemMenuList{_itmMenuLst: $_itmMenuLst}';
  }
}