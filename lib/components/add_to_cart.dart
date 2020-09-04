import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/lists/order_list.dart';
import 'package:food_app/model/cart_list.dart';
import 'package:food_app/model/food_item.dart';
import 'package:food_app/model/mdl_item_menus.dart';
import 'package:toast/toast.dart';

class AddToCart extends StatefulWidget {

  final ItemMenus foodItem;
  const AddToCart ({ Key key, this.foodItem }) : super( key:key );

  @override
  _AddToCartState createState() => _AddToCartState(this.foodItem);
}

class _AddToCartState extends State<AddToCart> {
  ItemMenus foodItem;
  CartList cart = CartList.instance;
  int qty = 1;
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
          InkWell(
            onTap: () async{
               await Navigator.push(context, MaterialPageRoute(
                builder: (context) => OrderList(),
              ));
               setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Badge(
                child: Icon(Icons.shopping_cart, color: Colors.white, size: 40,),
                badgeContent: Text(cart.list.length.toString(), style: TextStyle(color: Colors.white),),
                badgeColor: Colors.amber,
                toAnimate: true,
                animationType: BadgeAnimationType.fade,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Flexible(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Image(
                  fit: BoxFit.cover,
                  image: foodItem.photo.contains('no') ? AssetImage('assets/${foodItem.photo}') : NetworkImage(foodItem.photo),
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
                                'PKR \n${foodItem.salePrice}/-',
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
                                      'Detail',
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
//                              Align(
//                                alignment: Alignment.bottomRight,
//                                child: Text(
//                                  'GST ${foodItem.gst}',
//                                  textAlign: TextAlign.left,
//                                  style: TextStyle(
//                                    fontSize: 8,
//                                    color: Colors.red[400],
//                                    fontWeight: FontWeight.bold,
//                                  ),
//                                ),
//                              ),
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
                  padding: const EdgeInsets.fromLTRB(8, 2, 8, 16),
                  child: Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                        ),
                    ),
                    elevation: 10.0,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                                icon: Icon(
                                  Icons.remove_circle,
                                  size: 30,
                                ),
                              color: Colors.red,
                                onPressed: (){
                                  setState(() {
                                    if(qty > 1)
                                      {
                                        qty -= 1;
                                        foodItem.quantity -= 1;
                                      }
                                  });
                                },
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 15.0),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[400],
                                      blurRadius: 3,
                                      spreadRadius: 0.5,
                                    ),
                                  ],
                                  shape: BoxShape.circle,
                                  color: Colors.amberAccent,
                                ),
                                child: Center(
                                  child: Text(
                                      qty.toString(),
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Ubuntu',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.add_circle,
                                size: 30,
                              ),
                              color: Colors.red,
                              onPressed: (){
                                setState(() {
                                  qty += 1;
                                  foodItem.quantity += 1;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 30,),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.08,
                          child: RaisedButton.icon(
                            color: Colors.amber[400],
                            onPressed: (){
                              setState(() {
                                if(qty <= 0)
                                {
                                  Toast.show('Please add at least one item',context);
                                }
                                else{
                                  cart.addItem(ItemMenus(id: foodItem.id, code: foodItem.code, name: foodItem.name, salePrice: foodItem.salePrice, percentage: foodItem.percentage, photo: foodItem.photo, quantity: foodItem.quantity));
                                  Toast.show(foodItem.name + ' Added..',context);
                                  print('Add to Cart: '+cart.listLength());
                                }
                              });
                            },
                            icon: Icon(
                                Icons.add_shopping_cart,
                                color: Colors.red,
                              size: 20,
                            ),
                            label: Text(
                                'Add to Cart',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Ubuntu',
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                wordSpacing: 2,
                                fontStyle: FontStyle.normal,
                              ),
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
    );
  }
}

