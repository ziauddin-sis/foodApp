import 'package:flutter/material.dart';
import 'package:food_app/components/add_to_cart.dart';
import 'package:food_app/components/image_slider.dart';
import 'package:food_app/lists/burger-list.dart';
import 'package:food_app/lists/menu-list.dart';

void main() => runApp(MaterialApp(
  title: 'Food App',
  debugShowCheckedModeBanner: false,
  initialRoute: '/cart',
  routes: {
    '/' : (context) => MainScreen(),
    '/menu' : (context) => MenuItems(),
    '/burger': (context) => Burgers(),
    '/cart' : (context) => AddToCart(),
  },
));

class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: Text('Food App'),
        centerTitle: true,
      ),
      body: ImageSlider(),
    );
  }
}
