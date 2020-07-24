import 'package:flutter/material.dart';
import 'package:food_app/lists/burger_list_generator.dart';
import 'package:food_app/model/food_item.dart';
import 'package:toast/toast.dart';

class Burgers extends StatefulWidget {
  @override
  _BurgersState createState() => _BurgersState();
}

class _BurgersState extends State<Burgers> {

  List<FoodItem> lst = [];

  @override
  void initState() {
    super.initState();

    lst = [
      FoodItem(img: '1.jpg', name: 'Crispy Zinger', price: '180', detail: 'Chicken crunch burger', gst: '20'),
      FoodItem(img: '5.jpg', name: 'The Hardbord Room', price: '600', detail: 'Beaf patty with mozzarella cheese', gst: '20'),
      FoodItem(img: 'burger.jpg', name: 'Marben', price: '550', detail: 'Large beaf patty', gst: '30'),
      FoodItem(img: 'mughlai.jpg', name: 'Mughlai Chicken Burg', price: '149', detail: 'Juicy chicken chunks', gst: '9'),
      FoodItem(img: 'shotgun.jpg', name: 'Peri Peri Shotgun', price: '180', detail: 'New Peri Peri Shotgun Chicken burger', gst: '37'),
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
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: lst.length,
//        itemExtent: 120.0,
        itemBuilder: (context, index){
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: BurgerListGen(lst[index]),
          );
        },
      ),
    );
  }
}