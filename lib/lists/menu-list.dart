import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:food_app/lists/burger-list.dart';
import 'package:food_app/model/cart_list.dart';
import 'package:food_app/model/food_list.dart';

import 'order_list.dart';

class MenuItems extends StatefulWidget {
  @override
  _MenuItemsState createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {

  CartList cart = CartList.instance;
  List<FoodList> lst = [];

  @override
  void initState() {
    super.initState();

    lst = [
      FoodList(name: "Burger", image: 'burger.jpg'),
      FoodList(name: "Pizza", image: 'pizza.jpg'),
      FoodList(name: "Fries", image: 'fries.jpg'),
      FoodList(name: "Drinks", image: 'drinks.jpg'),
      FoodList(name: "Extras", image: 'extras.jpg'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: Text('Menu'),
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
                child: Icon(Icons.shopping_cart, color: Colors.white,size: 40),
                badgeContent: Text(cart.listLength(), style: TextStyle(color: Colors.white),),
                badgeColor: Colors.amber,
                toAnimate: true,
                animationType: BadgeAnimationType.fade,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: lst.length,
        itemExtent: 110.0,
        itemBuilder: (context, index){
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Card(
              elevation: 5.0,
              child: Center(
                child: ListTile(
                  contentPadding: EdgeInsets.all(20.0),
                  title: Text(
                      lst[index].name,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.normal,
                      letterSpacing: 2.0,
                      color: Colors.amber[400],
                    ),
                  ),
                  leading: CircleAvatar(
                    radius: 25.0,
                    backgroundImage: AssetImage('assets/${lst[index].image}'),
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Colors.grey[500],
                  ),
                  onTap: () async{
                   await Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Burgers(),
                   ));
                   setState(() {
                   });
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

//  Future<bool> _onBackPressed() {
//    Navigator.pop(context,{
//      'length' : data['length'],
//    });
//  }
}