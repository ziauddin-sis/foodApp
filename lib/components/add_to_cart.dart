import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:food_app/model/cart_list.dart';
import 'package:food_app/model/food_item.dart';
import 'package:toast/toast.dart';

class AddToCart extends StatefulWidget {

  final FoodItem foodItem;
  const AddToCart ({ Key key, this.foodItem }) : super( key:key );

  @override
  _AddToCartState createState() => _AddToCartState(this.foodItem);
}

class _AddToCartState extends State<AddToCart> {
  FoodItem foodItem;
  CartList cart = CartList.instance;
  int qty = 0;
  _AddToCartState(this.foodItem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: Text('Add to Cart'),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Badge(
              child: Icon(Icons.shopping_cart, color: Colors.white, size: 40,),
              badgeContent: Text(cart.listLength().toString(), style: TextStyle(color: Colors.white),),
              badgeColor: Colors.amber,
              toAnimate: true,
              animationType: BadgeAnimationType.fade,
            ),
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Flexible(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/${foodItem.img}'),
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: Material(
                          color: Colors.white,
                          elevation: 5,
                          shadowColor: Colors.grey[300],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'PKR \n${foodItem.price}/-',
                                  maxLines: 2,
                                  textAlign: TextAlign.justify,
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[500],
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                    fontFamily: 'Ubuntu',
                                  ),
                                ),
                                VerticalDivider(),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        foodItem.name,
                                        maxLines: 1,
                                        textAlign: TextAlign.justify,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.amber,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5,
                                          fontFamily: 'Ubuntu',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        foodItem.detail,
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey[400],
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    'GST ${foodItem.gst}',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 8,
                                      color: Colors.red[400],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                    child: Material(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0) )),
                      elevation: 10.0,
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                              icon: Icon(Icons.remove_circle,),
                            color: Colors.red,
                              onPressed: (){
                                setState(() {
                                  if(qty > 0)
                                    {
                                      qty -= 1;
                                      foodItem.quantity -= 1;
                                    }
                                });
                              },
                          ),
                          Text(qty.toString()),
                          IconButton(
                            icon: Icon(Icons.add_circle,),
                            color: Colors.red,
                            onPressed: (){
                              setState(() {
                                qty += 1;
                                foodItem.quantity += 1;
                              });
                            },
                          ),
                          RaisedButton.icon(
                              onPressed: (){
                                setState(() {
                                  if(qty <= 0)
                                  {
                                    Toast.show('Please add at least one item',context);
                                  }
                                  else{
                                    cart.addItem(foodItem);
                                    Toast.show(foodItem.name + ' Added..',context);
                                    print('Add to Cart: '+cart.listLength());
                                  }
                                });
                              },
                              icon: Icon(Icons.add_shopping_cart),
                              label: Text('Add to Cart'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    Navigator.pop(context,{
      'length' : cart.listLength(),
    });
  }
}

