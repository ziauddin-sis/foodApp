import 'dart:io';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:food_app/components/add_to_cart.dart';
import 'package:food_app/database/tables/tbl_item_menus.dart';
import 'package:food_app/lists/burger_list_generator.dart';
import 'package:food_app/model/cart_list.dart';
import 'package:food_app/model/food_item.dart';
import 'package:food_app/model/mdl_item_menus.dart';

import 'order_list.dart';

class Burgers extends StatefulWidget {
  @override
  _BurgersState createState() => _BurgersState();
}

class _BurgersState extends State<Burgers> {

  final itemMenusDBHelper = TblItemMenus.itemMenusInstance;
  CartList cart = CartList.instance;
  List<FoodItem> lst = [];
  List<ItemMenus> itmMenusLst = [];
  bool isList = false;

  @override
  void initState() {
    super.initState();
    lst = [
      FoodItem.name(
          '1.jpg', 'Crispy Zinger', 'Chicken crunch burger', 200, 27, 1),
      FoodItem.name('5.jpg', 'The Hardbord Room',
          'Beaf patty with mozzarella cheese', 600, 31, 1),
      FoodItem.name('burger.jpg', 'Marben', 'Large beaf patty', 500, 76, 1),
      FoodItem.name('mughlai.jpg', 'Mughlai Chicken Burg',
          'Juicy chicken chunks', 149, 9, 1),
      FoodItem.name('shotgun.jpg', 'Peri Peri Shotgun',
          'New Peri Peri Shotgun Chicken burger', 180, 35, 1),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    print(args['catName']);

    Future getItemMenus() async{
      var itmMenus = await itemMenusDBHelper.getSpecificItemMenus(args['catName']);
      itmMenus.forEach((element) {
        itmMenusLst.add(ItemMenus(id: element['id'], code : element['code'], name: element['name'], salePrice: element['sale_price'],
        photo: element['photo'] == null ? 'no_image.jpg' : element['photo'] , categoryName: element['category_name'], percentage: element['percentage']));
      });

      itmMenusLst.forEach((element) {
        print(element);
      });

      if(itmMenusLst.length > 0){
        setState(() {
          isList = true;
        });
      }
    }

    getItemMenus();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: Text('Burgers'),
        centerTitle: true,
        actions: <Widget>[
          InkWell(
            onTap: () async{
              await Navigator.push(context, MaterialPageRoute(
                builder: (context) => OrderList(),
              ));
              setState(() {

              });
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Badge(
                child: Icon(Icons.shopping_cart, color: Colors.white, size: 40),
                badgeContent: Text(
                  cart.listLength(),
                  style: TextStyle(color: Colors.white),
                ),
                badgeColor: Colors.amber,
                toAnimate: true,
                animationType: BadgeAnimationType.fade,
              ),
            ),
          ),
        ],
      ),
      body: isList ?  ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: itmMenusLst.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Material(
              color: Colors.white,
              elevation: 5,
              borderRadius: BorderRadius.circular(10),
              shadowColor: Colors.amberAccent[100],
              child: InkWell(
                child: BurgerListGen(lst[index]),
                onTap: () async {
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddToCart(
                          foodItem: lst[index],
                        ),
                      ));
                  setState(() {});
                },
              ),
            ),
          );
        },
      ) :  Center(child: CircularProgressIndicator(
        strokeWidth: 5,
        backgroundColor: Colors.yellow[300],
        valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
      )),
    );
  }
}
