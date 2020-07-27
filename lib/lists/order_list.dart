import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:food_app/model/cart_list.dart';
import 'package:food_app/model/food_item.dart';

class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  CartList cart = CartList.instance;
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: Text('Orders'),
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
      body: AnimatedList(
        key: _key,
        initialItemCount: cart.list.length,
        itemBuilder: (context, index, animation) {
          return _buildItem(cart.list[index], animation, index);
        },
      ),
    );
  }

  // ignore: missing_return
  Widget _buildItem(FoodItem list, Animation<double> animation, int index) {
    try{
      return SizeTransition(
        sizeFactor: animation,
        child: Card(
          elevation: 2,
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/${cart.list[index].img}'),
            ),
            title: Text(cart.list[index].name),
            subtitle: Text(
                '${cart.list[index].quantity} x ${cart.list[index].price} = ${cart.list[index].quantity * cart.list[index].price}'),
            trailing: IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: (){
                _removeItem(index);
                setState(() {

                });
              },
            ),
          ),
        ),
      );
    }catch(e) {
      print(e);
    }
  }

  void _removeItem(int index) {
    FoodItem removeItem = cart.list.removeAt(index);
    AnimatedListRemovedItemBuilder builder = (context, animation){
      return _buildItem(removeItem, animation, index);
    };
    _key.currentState.removeItem(index, builder);
  }

}
