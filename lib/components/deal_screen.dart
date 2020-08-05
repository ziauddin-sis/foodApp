import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/database/dbhelper.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class DealScreen extends StatefulWidget {
  @override
  _DealScreenState createState() => _DealScreenState();
}
final dbHelper = DBHelper.instance;

class _DealScreenState extends State<DealScreen> {

  Deal2 d;
  List<Deal2> myLst = [];

  Future getList() async{
    d = Deal2('Test deal');
    try{
      myLst = await d.dealItems();
      setState(() {
        myLst = myLst;
      });
    }
    catch(e)
    {
      print(e);
    }

    for(int i=0; i < myLst.length; i++)
    {
      print('${i+1} : ${myLst[i].dealName}');
      if(myLst[i].children.length > 0)
      {
        for(var pro in myLst[i].children)
        {
          print('    ${pro.dealName}');
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: Text('Deals'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemBuilder: (context, index) => EntryItem(myLst[index]),
          itemCount: myLst.length,
      ),
    );
  }
}

class EntryItem extends StatelessWidget {

  final Deal2 deal2;
  const EntryItem(this.deal2);
  final String _character = 'nothing';

  @override
  Widget build(BuildContext context) {
    return _buildTiles(deal2);
  }

  Widget _buildTiles(Deal2 deal2) {
//    if (deal2.children.isEmpty) return ListTile(
//        title: Text(deal2.dealName),
//        leading: Radio(
//            value: 0,
//            groupValue: _character,
//            onChanged: (val){
//              setSt
//              print('Radio Button : $val');
//            }),
//    );
    return ExpansionTile(
        key: PageStorageKey<Deal2>(deal2),
        title: Text(deal2.dealName, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red), ),
        subtitle: Text('Choose any One'),
        children: <Widget>[
          RadioButtonGroup(
              labels: deal2.children.map((e) => e.dealName).toList(),
              onSelected: (val){
                print(val);
              },
          ),
        ],
    );
  }
}


class Deal2{
  String dealName;
  List<Deal2> children;
  List<Deal2> productLst = [];

  Deal2( this.dealName, [ this.children = const <Deal2>[] ]);

  Future<List<Deal2>> dealItems() async{
    var product = await dbHelper.getSpecific(dealName);
    for(int i = 0; i < product.length; i++)
      {
        var productItem = await dbHelper.getItems(product[i]['category']);

        List<Deal2> itmLst = List();

        productItem.forEach((element) {
          if(element.containsKey('item'))
            {
              itmLst.add(Deal2(element['item']));
            }
          else{
            productLst.add(Deal2(product[i]['category']));
          }
        });
        productLst.add(Deal2(product[i]['category'], itmLst));
    }
    return Future.value(productLst);
//    for(int i=0; i < productLst.length; i++)
//    {
//      print('${i+1} : ${productLst[i].dealName}');
//      if(productLst[i].children.length > 0)
//      {
//        for(var pro in productLst[i].children)
//        {
//          print(pro.dealName);
//        }
//      }
//    }
  }
}
