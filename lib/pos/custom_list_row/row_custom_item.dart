import 'package:flutter/material.dart';
import 'package:food_app/model/mdl_item_menus.dart';

class CustomRowItem extends StatelessWidget {

  final ItemMenus _itemMenus;
  const CustomRowItem(this._itemMenus);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(8.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[700],
              offset: Offset(3,3),
              blurRadius: 3,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: _itemMenus.photo == null ? AssetImage('assets/no_image.jpg') : NetworkImage(_itemMenus.photo),
              radius: 25,
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _itemMenus.name,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    _itemMenus.salePrice,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: Icon(Icons.remove),
                  onTap: (){

                  },
                ),
                Text(_itemMenus.quantity.toString()),
                Icon(Icons.add),
              ],
            ),
            SizedBox(width: 10,),
            Icon(Icons.delete),
          ],
        ),
      ),
    );
  }
}
