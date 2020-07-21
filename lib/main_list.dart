import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'model/food_list.dart';

class MainList extends StatefulWidget {
  @override
  _MainListState createState() => _MainListState();
}

class _MainListState extends State<MainList> {

  List<FoodList> foodLst = [];

  @override
  void initState() {
    // TODO: implement initState
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
    return Container(
      child: Expanded(
        child: Container(
          margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
          child: ListView.builder(
            itemCount: foodLst.length,
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
                  onTap: (){
                    myToast(foodLst[index].name);
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void myToast(msg)
  {
    Toast.show(msg, context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM,
        backgroundColor: Colors.redAccent);
  }
}
