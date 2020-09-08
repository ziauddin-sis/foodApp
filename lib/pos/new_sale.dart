import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/components/register.dart';
import 'package:food_app/database/tables/tbl_categories.dart';
import 'package:food_app/model/mdl_categories.dart';

class NewSales extends StatefulWidget {
  @override
  _NewSalesState createState() => _NewSalesState();
}

class _NewSalesState extends State<NewSales> {

  final categoryDBHelper = TblCategories.categoriesInstance;
  String _orderType = 'Dine-In', _info = 'Table No. 1', _userName = 'ZiaUddin';
  List<Categories> catLst = [];

  Future getCategories() async{
    var categories = await categoryDBHelper.getCategories();
    categories.forEach((element) {
      catLst.add(Categories(id: element['id'],categoryName: element['category_name'], description: element['description'],
          userId: element['user_id'], companyId: element['company_id'], delStatus: element['del_status']));
    });
    catLst.forEach((element) {
      print(element);
    });
    return catLst;
  }

  @override
  Widget build(BuildContext context) {

    getCategories();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
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
                        size:  25,
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
          Expanded(
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.rectangle,
                      ),
                    ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellowAccent,
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            color: Colors.white,
                            child: FutureBuilder(
                                future: getCategories(),
                                builder: (context, snapShot){
                                  if(snapShot.connectionState == ConnectionState.none
                                      && snapShot.hasData == null){
                                    return Center(child: CircularProgressIndicator());
                                  }
                                  return GridView.builder(
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: catLst.length,
                                      itemBuilder: (context, index){
                                        return Card(
                                          color: Colors.redAccent,
                                          child: Center(
                                            child: Text(catLst[index].categoryName,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                              ),),
                                          ),
                                        );
                                      }
                                  );
                                }
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 4,
                          child: Container(
                            color: Colors.cyan,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

