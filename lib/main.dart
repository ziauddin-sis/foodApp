import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:food_app/components/add_to_cart.dart';
import 'package:food_app/components/image_slider.dart';
import 'package:food_app/database/db_demo.dart';
import 'package:food_app/lists/burger-list.dart';
import 'package:food_app/lists/menu-list.dart';
import 'package:food_app/lists/order_list.dart';
import 'package:food_app/model/cart_list.dart';
import 'package:toast/toast.dart';
import 'model/food_list.dart';


void main() => runApp(MaterialApp(
  title: 'Food App',
  debugShowCheckedModeBanner: false,
  initialRoute: '/db',
  routes: {
//    '/' : (context) => MainScreen(),
    '/menu' : (context) => MenuItems(),
    '/burger': (context) => Burgers(),
    '/cart' : (context) => AddToCart(),
    '/db' : (context) => DBDemo(),
  },
));

class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  CartList cart = CartList.instance;
  List<FoodList> foodLst = [];

  @override
  void initState() {
    super.initState();

    foodLst = [
      FoodList(image: 'menu.jpg', name: 'Menu'),
      FoodList(image: '1.jpg', name: 'Deals'),
      FoodList(image: '2.jpg', name: 'Combos'),
      FoodList(image: '3.jpg', name: 'Promo Offers'),
      FoodList(image: '4.jpg', name: 'Family Bag')
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: Text('Food App'),
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
      body: Column(
        children: <Widget>[
          ImageSlider(),
      Container(
        child: Expanded(
          child: Container(
            margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
            child: ListView.builder(
              itemCount: foodLst.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index){
                return Card(
                  elevation: 5.0,
                  child: ListTile(
                    title: Text(
                      foodLst[index].name,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.normal,
                        letterSpacing: 1.5,
                        color: Colors.amber[400],
                      ),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/${foodLst[index].image}'),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Colors.grey[500],
                    ),
                    onTap: () async{

                      if (identical(foodLst[index].name, "Menu"))
                      {
                         await Navigator.push(context, MaterialPageRoute(
                          builder: (context) => MenuItems(),
                        ));
                        setState(() {
                        });
                      }
                      else{
                        Toast.show('No item for now', context);
                      }
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
        ],
      ),
    );
  }
}
