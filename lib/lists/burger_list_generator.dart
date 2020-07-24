import 'package:flutter/material.dart';
import 'package:food_app/model/food_item.dart';

class BurgerListGen extends StatelessWidget {
  FoodItem _foodItem;

  BurgerListGen(this._foodItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        color: Colors.white,
        elevation: 10,
        borderRadius: BorderRadius.circular(10),
        shadowColor: Colors.amberAccent[100],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/${_foodItem.img}'),
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          _foodItem.name,
                          textAlign: TextAlign.justify,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber[400],
                          ),
                        ),
                        SizedBox(height: 3,),
                        Text(
                          _foodItem.detail,
                          textAlign: TextAlign.justify,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 1),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'PKR ${_foodItem.price}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                          wordSpacing: 1,
                          color: Colors.grey[800],
                        ),
                      ),
                      SizedBox(height: 24,),
                      Text(
                        'GST ${_foodItem.gst}',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          color: Colors.red[500],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
           ],
      ),
        ),
     ),
    );
  }
}
