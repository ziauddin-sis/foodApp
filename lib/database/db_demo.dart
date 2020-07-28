import 'package:flutter/material.dart';
import 'package:food_app/database/dbhelper.dart';

class DBDemo extends StatefulWidget {
  @override
  _DBDemoState createState() => _DBDemoState();
}

class _DBDemoState extends State<DBDemo> {

  final dbHelper = DBHelper.instance;

  void insertRow() async{
    Map<String, dynamic> row = {
      DBHelper.dealName : 'Test deal',
      DBHelper.dealPrice : 1200,
      DBHelper.category : 'Fries',
      DBHelper.chooseAny : 'Choose any one',
      DBHelper.quantity : 1,
      DBHelper.itemName : 'Plain Fries',
    };
    final id = await  dbHelper.insertRow(row);
    print('Row ID: $id');
  }

  void getAll() async{
    var getAll = await dbHelper.getAll();
    getAll.forEach((row) {
      print(row);
    });
  }

  void getSp() async {
    var getSpecific = await dbHelper.getSpecific('Test deal');
    getSpecific.forEach((row) {
      print(row);
    });
  }

    void getSpecificAll() async{
      var getSpecificAll = await dbHelper.getSpecificAll('Test deal');
      getSpecificAll.forEach((row) {
        print(row);
      });

  }

  void mixList() async{
    List<String> lst = List();
    List<Map<String, dynamic>> distinct = await dbHelper.getSpecificAll('Test deal');
    List<Map<String, dynamic>> lstTbl = await dbHelper.getSpecificAll('Test deal');
    distinct.forEach((e1) {
      print(e1['category']);
      print(e1['any']);
      lstTbl.forEach((e2) {
        if(e1['category'] == e2['category'])
          {
            lst.add(e2['item']);
          }
      });
      print(lst);
      lst.clear();
      return;
    });
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
            RaisedButton(
              onPressed: getSp,
              child: Text("Get distinct"),
            ),
            RaisedButton(
              onPressed: mixList,
              child: Text("Get Sp. List"),
            ),
          ],
        ),
      ),
    );
  }
}