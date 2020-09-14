import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:food_app/model/mdl_item_menus.dart';

class ProItemMenus extends ChangeNotifier{

  final List<ItemMenus> _proItemList = [];
  UnmodifiableListView<ItemMenus> get item => UnmodifiableListView(_proItemList);

  addNewItemInList(ItemMenus _itm){
    ItemMenus itm = ItemMenus(id: _itm.id, name: _itm.name, salePrice: _itm.salePrice,
    quantity: _itm.quantity, photo: _itm.photo, categoryName: _itm.categoryName, percentage: _itm.percentage, code: _itm.code);
    _proItemList.add(itm);

    notifyListeners();
  }

}