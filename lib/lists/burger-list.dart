import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:food_app/components/add_to_cart.dart';
import 'package:food_app/lists/burger_list_generator.dart';
import 'package:food_app/model/cart_list.dart';
import 'package:food_app/model/food_item.dart';

class Burgers extends StatefulWidget {
  @override
  _BurgersState createState() => _BurgersState();
}

class _BurgersState extends State<Burgers> {
  CartList cart = CartList.instance;
  List<FoodItem> lst = [];

  @override
  void initState() {
    super.initState();
    lst = [
      FoodItem.name(
          '1.jpg', 'Crispy Zinger', 'Chicken crunch burger', 200, 27, 0),
      FoodItem.name('5.jpg', 'The Hardbord Room',
          'Beaf patty with mozzarella cheese', 600, 31, 0),
      FoodItem.name('burger.jpg', 'Marben', 'Large beaf patty', 500, 76, 0),
      FoodItem.name('mughlai.jpg', 'Mughlai Chicken Burg',
          'Juicy chicken chunks', 149, 9, 0),
      FoodItem.name('shotgun.jpg', 'Peri Peri Shotgun',
          'New Peri Peri Shotgun Chicken burger', 180, 35, 0),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: Text('Burgers'),
        centerTitle: true,
        actions: <Widget>[
          Padding(
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
        ],
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: lst.length,
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
      ),
    );
  }
}
