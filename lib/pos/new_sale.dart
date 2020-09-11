import 'package:flutter/material.dart';
import 'package:food_app/database/tables/tbl_categories.dart';
import 'package:food_app/model/list/item_menu_list.dart';
import 'package:food_app/model/mdl_categories.dart';
import 'package:food_app/pos/tab_bar_view.dart';

class EPos extends StatefulWidget{

  @override
  _EPosState createState() => _EPosState();
}

class _EPosState extends State<EPos> {

  final categoryDBHelper = TblCategories.categoriesInstance;

  String _orderType = 'Dine-In', _info = 'Table No. 1', _userName = 'ZiaUddin';

  List<Categories> catLst = [];

  final ItemMenuList instance2 = ItemMenuList.instance;

  Future getCategories() async {
    catLst.clear();
    var categories = await categoryDBHelper.getCategories();
    categories.forEach((element) {
      catLst.add(Categories(
          id: element['id'],
          categoryName: element['category_name'],
          description: element['description'],
          userId: element['user_id'],
          companyId: element['company_id'],
          delStatus: element['del_status']));
    });
    catLst.forEach((element) {
      print(element);
    });
    return catLst;
  }

  void refresh(){
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          //#region AppBar
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.15,
            color: Colors.redAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(8, 10, 0, 0),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(4, 8, 10, 8),
                        child: Text(
                          _orderType,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Ubuntu',
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(8, 10, 0, 0),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                    child: Text(
                      _info,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.amberAccent,
                        fontFamily: 'Ubuntu',
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, right: 5),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.red,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 8, 8, 8),
                        child: Text(
                          _userName,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                            fontFamily: 'Ubuntu',
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: MediaQuery.of(context).size.height * 0.041,
                        child: CircleAvatar(
                          radius: MediaQuery.of(context).size.height * 0.04,
                          backgroundImage: AssetImage('assets/user.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //endregion
          Expanded(
            child: Row(
              children: [
                //# region Menu
                Flexible(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellowAccent,
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.white,
                            child: FutureBuilder(
                                future: getCategories(),
                                builder: (context, snapShot) {
                                  if (snapShot.connectionState ==
                                          ConnectionState.none &&
                                      snapShot.hasData == null) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }
                                  return MaterialApp(
                                    debugShowCheckedModeBanner: false,
                                    home: DefaultTabController(
                                      length: catLst.length,
                                      child: Scaffold(
                                        backgroundColor: Colors.white,
                                        appBar: PreferredSize(
                                          preferredSize:
                                              Size.fromHeight(kToolbarHeight),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.1,
                                            child: TabBar(
                                              indicatorColor:
                                                  Colors.amberAccent,
                                              isScrollable: true,
                                              tabs: catLst
                                                  .map<Widget>((Categories c) {
                                                return Tab(
                                                  icon: Icon(
                                                    Icons.style,
                                                    color: Colors.amberAccent,
                                                    size: 15,
                                                  ),
                                                  child: Text(
                                                    c.categoryName
                                                        .toUpperCase(),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ),
                                        body: TabBarView(
                                          children: catLst.map((Categories c) {
                                            return TabBarVigewChild(categoryName:c.categoryName);
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //endregion
                //# region OrderList
                Flexible(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                    ),
                    child: ListView.builder(
                          itemCount: instance2.list.length,
                          itemBuilder: (context, index){
                            return ListTile(
                              title: Text(instance2.list[index].name),
                            );
                          },
                        ),
                  ),
                ),
                //endregion
              ],
            ),
          ),
        ],
      ),
    );
  }
}
