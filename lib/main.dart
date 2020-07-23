import 'package:flutter/material.dart';
import 'package:food_app/components/image_slider.dart';
import 'package:food_app/lists/burger-list.dart';
import 'package:food_app/lists/burger_list_generator.dart';
import 'package:food_app/lists/menu-list.dart';

void main() => runApp(MaterialApp(
  title: 'Food App',
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/' : (context) => MainScreen(),
    '/menu' : (context) => MenuItems(),
    '/burger': (context) => Burgers(),
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
