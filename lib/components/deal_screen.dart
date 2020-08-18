import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///D:/Flutter/foodApp/lib/database/tables/dbhelper.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class DealScreen extends StatefulWidget {
  @override
  _DealScreenState createState() => _DealScreenState();
}
final dbHelper = DBHelper.instance;
int totalQty = 0;
List<String> _picked = List(totalQty);

class _DealScreenState extends State<DealScreen> {

  Deal2 d;
  List<Deal2> myLst = [];

  Future getList() async{
    String deal = 'Azadi Deal';
    d = Deal2(proName: deal);
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
      print('${i+1} : ${myLst[i].proName}');
      if(myLst[i].children.length > 0)
      {
        for(var pro in myLst[i].children)
        {
          print('    ${pro.proName}');
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
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => EntryItem(myLst[index], index),
          itemCount: myLst.length,
      ),
    );
  }
}

class EntryItem extends StatelessWidget {

  final Deal2 deal2;
  final int mainIndex;
  const EntryItem(this.deal2, this.mainIndex);

  @override
  Widget build(BuildContext context) {
    return _buildTiles(deal2);
  }

  Widget _buildTiles(Deal2 deal2) {
    return ExpansionTile(
        key: PageStorageKey<Deal2>(deal2),
        initiallyExpanded: true,
        title: Text(deal2.proName, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red), ),
        children: <Widget>[
          ListView.builder(
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
              itemCount: deal2.qty,
              shrinkWrap: true,
              key: PageStorageKey<Deal2>(deal2),
              itemBuilder: (context, index){
                return ItemSubList(deal2, mainIndex+index);
              }),
        ],
    );
  }
}

class ItemSubList extends StatefulWidget {

  final Deal2 deal2;
  final int _index;
  const ItemSubList(this.deal2, this._index);

  @override
  _ItemSubListState createState() => _ItemSubListState();
}

class _ItemSubListState extends State<ItemSubList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(widget.deal2.any, textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            RadioButtonGroup(
              key: PageStorageKey(Deal2),
              picked: _picked[widget._index],
              activeColor: Colors.red,
              labels: widget.deal2.children.map((e) => e.proName).toList(),
              onSelected: (val){
                setState(() {
                  _picked[widget._index] = val;
                  print(val);
                  print(_picked);
                });
              },
            ),
          ],
        ),
    );
  }
}

class Deal2{
  String proName, any;
  int qty;
  List<Deal2> children;
  List<Deal2> productLst = [];

  Deal2({ this.proName, this.any, this.qty, this.children = const <Deal2>[] });


  Future<List<Deal2>> dealItems() async{
    var product = await dbHelper.getSpecific(this.proName);
    for(int i = 0; i < product.length; i++)
      {
        var productItem = await dbHelper.getItems(product[i]['category']);
        totalQty += product[i]['qty'];
        List<Deal2> itmLst = List();

        productItem.forEach((e) {
          if(e.containsKey('item'))
            {
              itmLst.add(Deal2(proName: e['item']));
            }
          else{
            productLst.add(Deal2(proName: product[i]['category'], any: product[i]['any'], qty: product[i]['qty']));
          }
        });
        productLst.add(Deal2(proName: product[i]['category'], any: product[i]['any'], qty: product[i]['qty'], children: itmLst));
    }
    return Future.value(productLst);
  }
}
