import 'package:flutter/material.dart';
import 'package:food_app/database/tables/tbl_item_menus.dart';
import 'package:food_app/model/list/item_menu_list.dart';
import 'package:food_app/model/mdl_item_menus.dart';
import 'package:food_app/pos/new_sale.dart';


class TabBarViewChild extends StatefulWidget {

    String categoryName;
    TabBarViewChild({Key key, this.categoryName}) : super(key:key);

  @override
  _TabBarViewChildState createState() => _TabBarViewChildState();
}

class _TabBarViewChildState extends State<TabBarViewChild> {

    EPos ePos;

    final ItemMenuList instance1 = ItemMenuList.instance;

    List<ItemMenus> itmLst = [];

    final itemMenus = TblItemMenus.itemMenusInstance;

    Future getSpecificItemMenus() async{
      var items = await itemMenus.getSpecificItemMenus(widget.categoryName);
      itmLst.clear();
      items.forEach((e) {
        itmLst.add(ItemMenus(id: e['id'], categoryName: e['category_name'], code: e['code'],
        name: e['name'], percentage: e['percentage'], photo: e['photo'], quantity: e['quantity'],
        salePrice: e['sale_price']));
      });
      for (var value in itmLst) {
        print(value);
      }
      return itmLst;
    }

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ePos = EPos();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: FutureBuilder(
        future: getSpecificItemMenus(),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.none
              && snapShot.hasData == null) {
            return Center(child: CircularProgressIndicator());
          }
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              scrollDirection: Axis.vertical,
              itemCount: itmLst.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    child: Card(
                      elevation: 4,
                      color: Colors.amberAccent,
                      child: Center(
                        child: Text(
                          itmLst[index].name.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Ubuntu',
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),
                    onTap: (){
                      // Provider.of<ProItemMenus>(context, listen: false).addNewItemInList(ItemMenus(name: itmLst[index].name.toUpperCase()));
                      print(itmLst[index].name.toUpperCase());
                      instance1.addItem(ItemMenus(name: itmLst[index].name));
                    },
                  ),
                );
              }
          );;
        }
      ),
    );
  }
}
