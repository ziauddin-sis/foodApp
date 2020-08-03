import 'package:flutter/material.dart';
import 'package:food_app/database/dbhelper.dart';

class DBDemo extends StatefulWidget {
  @override
  _DBDemoState createState() => _DBDemoState();
}

class _DBDemoState extends State<DBDemo> {

  final dbHelper = DBHelper.instance;
  String dropdownValue = 'One';
  List<String> lst = [];
  List<String> variable = [];
  static int qty = 0, _value = 0;

  void insertRow() async{
    Map<String, dynamic> row = {
      DBHelper.dealName : 'Test deal',
      DBHelper.dealPrice : 1200,
      DBHelper.category : 'Drink',
      DBHelper.chooseAny : 'Choose any one',
      DBHelper.quantity : 1,
      DBHelper.itemName : 'Spirit',
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
      qty += int.parse(row['qty'].toString());
      lst.add(row['category']);
      print(row);
    });
    print(getSpecific);
    variable = List.generate(qty*2, (index) => 'One');
  }

    void getSpecificAll() async{
      var getSpecificAll = await dbHelper.getSpecificAll('Test deal');
      getSpecificAll.forEach((row) {
        print(row);
      });

  }

  void mixList() async{
    List<Map<String, dynamic>> distinct = await dbHelper.getSpecific('Test deal');
//    List<Map<String, dynamic>> lstTbl = await dbHelper.getSpecificAll('Test deal');
    distinct.forEach((e1) async{
      var getSpecific = await dbHelper.getItemList('Test deal', e1['category']);
      lst.clear();
      print(e1['category']);
      print(e1['any']);
      getSpecific.forEach((element) {
        lst.add(element['any']);
      });
      print(lst);
    });
  }

  @override
  void initState(){
    super.initState();
    getSp();
  }

  @override
  Widget build(BuildContext context) {
//    mixList();
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
            Expanded(
                child: ListView.builder(
                  itemCount: qty,
                  itemBuilder: (context, index){
                    return  Center(
                      child: Column(
                        children: <Widget>[
                          Text(lst[index]),
                          for(int i = 0; i < 2; i++)
                            DropdownButton<String>(
                              value: variable[index+i],
                              icon: Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              style: TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  variable[index+i] = newValue;
                                });
                              },
                              items: <String>['One', 'Two', 'Three', 'Four']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                        ],
                      ),
                    );
                  },
                ),
            ),
          ],
        ),
      ),
    );
  }
}