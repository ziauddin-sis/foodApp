import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_app/database/dbhelper.dart';
import 'package:food_app/database/tables/tbl_company.dart';
import 'package:food_app/model/deal.dart';
import 'package:food_app/model/mdl_company.dart';
import 'package:http/http.dart' as http;

class DBDemo extends StatefulWidget {
  @override
  _DBDemoState createState() => _DBDemoState();
}

class _DBDemoState extends State<DBDemo> {

  final dbHelper = DBHelper.instance;

  final companyDbHelper = TblCompany.instance;


  String dropdownValue = 'One';
  List<String> lst = [];
  List<String> flavor = [];
  List<String> variable = [];
  static int qty = 0;

  List<Deal> cstLst = [];
  List<Deal> spLst = [];

  String deal = 'Azadi Deal';
  void insertRow() async{
    Map<String, dynamic> row = {
      DBHelper.dealName : deal,
      DBHelper.dealPrice : 1200,
      DBHelper.category : 'Drinks',
      DBHelper.chooseAny : 'Select One',
      DBHelper.quantity : 2,
      DBHelper.itemName : 'Spirit',
    };
    final id = await  dbHelper.insertRow(row);
    print('Row ID: $id');
  }

//  Future<List<String>> getItems(String cat) async{
//    var items = await dbHelper.getItems(cat);
//    if(flavor.length > 0){
//      flavor = flavor;
//    }
//    else{
//      items.forEach((element) {
//        flavor.add(element['item']);
//      });
//    }
//    return flavor;
//  }

  Future getAll() async{
    var getAll = await dbHelper.getAll();
    getAll.forEach((row) {
      cstLst.add(Deal(deal: row['deal'], price: row['price'], any: row['any'], category: row['category'],
          id: row['id'], item: row['item'], qty: row['qty']));
    });
    cstLst.forEach((element) {
      Deal deal = element;
      print(deal.toString());
    });
  }

//  Future getSp() async {
//    var getSpecific = await dbHelper.getSpecific(deal);
//    qty = 0;
//
//    getSpecific.forEach((row) {
//      qty += row['qty'];
//      lst.add(row['category']);
//      spLst.add(Deal(category: row['category'], qty: row['qty'], any: row['any']));
//    });
//    variable = List.generate(qty, (index) => spLst[index].any);
//    spLst.forEach((element) {
//      print(element.toString());
//    });
//    print(variable);
//    setState(() {
//
//    });
//  }

//    void getSpecificAll() async{
//      var getSpecificAll = await dbHelper.getSpecificAll(deal);
//      getSpecificAll.forEach((row) {
//        print(row);
//      });
//
//  }

//  void mixList() async{
//    List<Map<String, dynamic>> distinct = await dbHelper.getSpecific(deal);
//    List<Map<String, dynamic>> lstTbl = await dbHelper.getSpecificAll('Test deal');
//    distinct.forEach((e1) async{
//      var getSpecific = await dbHelper.getItemList('Test deal', e1['category']);
//      lst.clear();
//      print(e1['category']);
//      print(e1['any']);
//      getSpecific.forEach((element) {
//        lst.add(element['any']);
//      });
//      print(lst);
//    });
//  }

  Future<dynamic> getWebServices() async{
    List data;
    var response = await http.get(
        Uri.encodeFull("http://72.52.142.19/cloud-kitchen/api/install?auth=622780154&sale_limit=20&expense_limit=20"),
      headers: {
      "Accept" : "application/json"
      }
    );
    var resBody = json.decode(response.body);
    data = resBody["company"];
    var company = Company.fromJson(data[0]);
    print(company);
    return company;
  }

  void insertCompany() async{
    var myRow = await getWebServices();

    Map<String, dynamic> row = {
      TblCompany.id : myRow.id,
      TblCompany.currency : myRow.currency,
      TblCompany.timezone : myRow.timezone,
      TblCompany.dateFormat : myRow.dateFormat,
      TblCompany.outletId : myRow.outletId,
      TblCompany.name : myRow.name,
      TblCompany.email : myRow.email,
      TblCompany.phone1 : myRow.phone1,
      TblCompany.phone2 : myRow.phone2,
      TblCompany.address : myRow.address,
      TblCompany.status : myRow.status,
      TblCompany.dateAdded : myRow.dateAdded,
      TblCompany.expiryDate : myRow.expiryDate,
      TblCompany.token : myRow.token
    };

    final id = await companyDbHelper.insertCompany(row);
    print('Company return ID: $id');
  }

  Future getCompanies() async{
    var getAll = await companyDbHelper.getCompanies();
    print(getAll);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    getAll();
//    getSp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database demo'),
        backgroundColor: Colors.red,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                onPressed: insertRow,
              child: Text("Insert"),
            ),

            RaisedButton(
              onPressed: getAll,
              child: Text("Get List"),
            ),
//            RaisedButton(
//              onPressed: getSp,
//              child: Text("Get distinct"),
//            ),
//            RaisedButton(
//              onPressed: mixList,
//              child: Text("Get Sp. List"),
//            ),
            RaisedButton(
              onPressed: getWebServices,
              child: Text("Get Web Data"),
            ),
            RaisedButton(
              onPressed: insertCompany,
              child: Text("Insert Company"),
            ),
            RaisedButton(
              onPressed: getCompanies,
              child: Text("Get Company"),
            ),
//            Expanded(
//                child: ListView.builder(
//                  shrinkWrap: true,
//                  physics: ClampingScrollPhysics(),
//                  itemCount: qty,
//                  itemBuilder: (context, index){
//                    return  Center(
//                      child: Column(
//                        children: <Widget>[
//                          Text(spLst[index].category),
//                          FutureBuilder<List<String>>(
//                            future: getItems(spLst[index].category),
//                            builder: (context, snapshot) {
//                              if (snapshot.hasError) {
//                                return Container();
//                              }
//                              else if (snapshot.hasData) {
//                                if(snapshot != null)
//                                  {
////                                    snapshot.data.forEach((element) {
////                                      flavor.add(element);
////
////                                    });
//                                    variable = flavor;
//                                  }
//                              }
//                              else{
//                                return CircularProgressIndicator();
//                              }
//                              return ListView.builder(
//                                shrinkWrap: true,
//                                physics: ClampingScrollPhysics(),
//                                itemCount: spLst[index].qty,
//                                itemBuilder: (context, index1) {
//                                  return DropdownButton<String>(
//                                    value: variable[index1],
//                                    icon: Icon(Icons.arrow_downward),
//                                    iconSize: 24,
//                                    elevation: 16,
//                                    style: TextStyle(color: Colors.deepPurple),
//                                    underline: Container(
//                                      height: 2,
//                                      color: Colors.deepPurpleAccent,
//                                    ),
//                                    onChanged: (String newValue) {
//                                      setState(() {
//                                        variable[index + index1] = newValue;
//                                      });
//                                    },
//                                    items: flavor
//                                        .map<DropdownMenuItem<String>>((
//                                        String value) {
//                                      return DropdownMenuItem<String>(
//                                        value: value,
//                                        child: Text(value),
//                                      );
//                                    }).toList(),
//                                  );
//                                },
//                              );
//                            }
//                          ),
//                        ],
//                      ),
//                    );
//                  },
//                ),
//            ),
          ],
        ),
      ),
    );
  }
}