import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_app/database/tables/tbl_categories.dart';
import 'file:///D:/Flutter/foodApp/lib/database/tables/dbhelper.dart';
import 'package:food_app/database/tables/tbl_company.dart';
import 'package:food_app/database/tables/tbl_customers.dart';
import 'package:food_app/database/tables/tbl_item_menus.dart';
import 'package:food_app/database/tables/tbl_item_modifiers.dart';
import 'package:food_app/database/tables/tbl_modifiers.dart';
import 'package:food_app/database/tables/tbl_outlet.dart';
import 'package:food_app/database/tables/tbl_tables.dart';
import 'package:food_app/database/tables/tbl_user.dart';
import 'package:food_app/model/deal.dart';
import 'package:food_app/model/mdl_categories.dart';
import 'package:food_app/model/mdl_company.dart';
import 'package:food_app/model/mdl_customers.dart';
import 'package:food_app/model/mdl_item_menus.dart';
import 'package:food_app/model/mdl_item_modifiers.dart';
import 'package:food_app/model/mdl_modifiers.dart';
import 'package:food_app/model/mdl_outlet.dart';
import 'package:food_app/model/mdl_tables.dart';
import 'package:food_app/model/mdl_user.dart';
import 'package:http/http.dart' as http;

class DBDemo extends StatefulWidget {
  @override
  _DBDemoState createState() => _DBDemoState();
}

class _DBDemoState extends State<DBDemo> {

  final dbHelper = DBHelper.instance;
  final companyDbHelper = TblCompany.instance;
  final outletDbHelper = TblOutlet.outletInstance;
  final userDbHelper = TblUsers.usersInstance;
  final tableDbHelper = TblTables.tablesInstance;
  final categoryDbHelper = TblCategories.categoriesInstance;
  final modifierDbHelper = TblModifiers.modifiersInstance;
  final itmMenusDbHelper = TblItemMenus.itemMenusInstance;
  final itmModifierDbHelper = TblItemModifiers.itemModifiersInstance;
  final customerDbHelper = TblCustomers.customersInstance;


  String dropdownValue = 'One';
  List<String> lst = [];
  List<String> flavor = [];
  List<String> variable = [];
  static int qty = 0;

  List<Deal> cstLst = [];
  List<Deal> spLst = [];

  //#region DealOnSpot
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

  //#endregion

  //#region Get All Web Service
  Future<dynamic> getWebServices() async{
    List data;
    var response = await http.get(
        Uri.encodeFull("http://72.52.142.19/cloud-kitchen/api/install?auth=622780154&sale_limit=20&expense_limit=20"), headers: {"Accept" : "application/json"});
    var resBody = json.decode(response.body);
    print(resBody);
//    data = resBody["company"];
//    var company = Company.fromJson(data[0]);
//    print(company);
    return resBody;
  }
  //#endregion

  //#region Company Table
  Future<dynamic> getCompanyFromWeb() async{
    List data;
    List<Company> lstCompany = [];
    var response = await http.get(
        Uri.encodeFull("http://72.52.142.19/cloud-kitchen/api/install?auth=622780154&sale_limit=20&expense_limit=20"), headers: {"Accept" : "application/json"});
    var resBody = json.decode(response.body);
    data = resBody["company"];
    for (int i = 0; i < data.length; i++)
      {
        lstCompany.add(Company.fromJson(data[i]));
      }
    return lstCompany;
  }

  void insertCompany() async{
    List<Company> myRow = await getCompanyFromWeb();
    for (int i = 0; i < myRow.length; i++)
      {
        Map<String, dynamic> row = {
          TblCompany.id : myRow[i].id,
          TblCompany.currency : myRow[i].currency,
          TblCompany.timezone : myRow[i].timezone,
          TblCompany.dateFormat : myRow[i].dateFormat,
          TblCompany.outletId : myRow[i].outletId,
          TblCompany.name : myRow[i].name,
          TblCompany.email : myRow[i].email,
          TblCompany.phone1 : myRow[i].phone1,
          TblCompany.phone2 : myRow[i].phone2,
          TblCompany.address : myRow[i].address,
          TblCompany.status : myRow[i].status,
          TblCompany.dateAdded : myRow[i].dateAdded,
          TblCompany.expiryDate : myRow[i].expiryDate,
          TblCompany.token : myRow[i].token
        };

        final id = await companyDbHelper.insertCompany(row);
        print('Company return ID: $id');
      }
  }

  Future getCompanies() async{
    var getAll = await companyDbHelper.getCompanies();
    print(getAll);
  }
  //#endregion

  //#region Outlet Table
  Future<dynamic> getOutletFromWeb() async{
    List data;
    List<Outlet> lstOutlet = [];
    var response = await http.get(
        Uri.encodeFull("http://72.52.142.19/cloud-kitchen/api/install?auth=622780154&sale_limit=20&expense_limit=20"),
        headers: {
          "Accept" : "application/json"
        }
    );
    var resBody = json.decode(response.body);
    data = resBody["outlet"];
    for (int i = 0; i < data.length; i++)
      {
        lstOutlet.add(Outlet.fromJson(data[i]));
      }
    return lstOutlet;
  }

  void insertOutlet() async{
    List<Outlet> mLst = await getOutletFromWeb();

    for (int i = 0; i < mLst.length; i++)
      {
        Map<String, dynamic> row = {
          TblOutlet.id : mLst[i].id,
          TblOutlet.outletName : mLst[i].outletName,
          TblOutlet.outletCode : mLst[i].outletCode,
          TblOutlet.address : mLst[i].address,
          TblOutlet.phone : mLst[i].phone,
          TblOutlet.invoicePrint : mLst[i].invoicePrint,
          TblOutlet.startingDate : mLst[i].startingDate,
          TblOutlet.invoiceFooter : mLst[i].invoiceFooter,
          TblOutlet.collectTax : mLst[i].collectTax,
          TblOutlet.preOrPostOrder : mLst[i].preOrPostOrder,
          TblOutlet.userId : mLst[i].userId,
          TblOutlet.companyId : mLst[i].companyId,
          TblOutlet.delStatus : mLst[i].delStatus,
        };

        final id = await outletDbHelper.insertOutlet(row);
        print('Outlet return ID: $id');
      }
  }

  Future getOutlets() async{
    var getAll = await outletDbHelper.getOutlets();
    print(getAll);
  }
  //#endregion

  //#region Users Table
  Future<dynamic> getUsersFromWeb() async{
    List data;
    List<Users> users = [];
    var response = await http.get(
        Uri.encodeFull("http://72.52.142.19/cloud-kitchen/api/install?auth=622780154&sale_limit=20&expense_limit=20"),
        headers: {
          "Accept" : "application/json"
        }
    );
    var resBody = json.decode(response.body);
    data = resBody["users"];
    for( int i = 0; i < data.length; i++)
      {
        users.add(Users.fromJson(data[i]));
      }
    print(users);
    return users;
  }

  void insertUser() async{
    List<Users> mLst = await getUsersFromWeb();

    for (int i = 0; i < mLst.length; i++)
      {
        Map<String, dynamic> row = {
          TblUsers.id : mLst[i].id,
          TblUsers.fullName : mLst[i].fullName,
          TblUsers.phone : mLst[i].phone,
          TblUsers.emailAddress : mLst[i].emailAddress,
          TblUsers.password : mLst[i].password,
          TblUsers.designation : mLst[i].designation,
          TblUsers.willLogin : mLst[i].willLogin,
          TblUsers.role : mLst[i].role,
          TblUsers.outletId : mLst[i].outletId,
          TblUsers.companyId : mLst[i].companyId,
          TblUsers.accountCreationDate : mLst[i].accountCreationDate,
          TblUsers.language : mLst[i].language,
          TblUsers.lastLogin : mLst[i].lastLogin,
          TblUsers.activeStatus : mLst[i].activeStatus,
          TblUsers.delStatus : mLst[i].delStatus,
        };
        final id = await userDbHelper.insertUser(row);
        print('User return ID: $id');
      }
  }

  Future getUsers() async{
    var getAll = await userDbHelper.getUsers();
    print(getAll);
  }
  //#endregion

  //#region Tables Table
  Future<dynamic> getTablesFromWeb() async{
    List data;
    List<Tables> tables = [];
    var response = await http.get(
        Uri.encodeFull("http://72.52.142.19/cloud-kitchen/api/install?auth=622780154&sale_limit=20&expense_limit=20"),
        headers: {
          "Accept" : "application/json"
        }
    );
    var resBody = json.decode(response.body);
    data = resBody["tables"];
    for( int i = 0; i < data.length; i++)
    {
      tables.add(Tables.fromJson(data[i]));
    }
    return tables;
  }

  void insertTable() async{
    List<Tables> mLst = await getTablesFromWeb();

    for (int i = 0; i < mLst.length; i++)
    {
      Map<String, dynamic> row = {
        TblTables.id : mLst[i].id,
        TblTables.name : mLst[i].name,
        TblTables.sitCapacity : mLst[i].sitCapacity,
        TblTables.position : mLst[i].position,
        TblTables.description : mLst[i].description,
        TblTables.userId : mLst[i].userId,
        TblTables.outletId : mLst[i].outletId,
        TblTables.companyId : mLst[i].companyId,
        TblTables.delStatus : mLst[i].delStatus,
      };

      final id = await tableDbHelper.insertTable(row);
      print('Tables return ID: $id');
    }
  }

  Future getTables() async{
    var getAll = await tableDbHelper.getTables();
    print(getAll);
  }
  //#endregion

  //#region Categories Table
  Future<dynamic> getCategoriesFromWeb() async{
    List data;
    List<Categories> categories = [];
    var response = await http.get(
        Uri.encodeFull("http://72.52.142.19/cloud-kitchen/api/install?auth=622780154&sale_limit=20&expense_limit=20"),
        headers: {
          "Accept" : "application/json"
        }
    );
    var resBody = json.decode(response.body);
    data = resBody["categories"];
    for( int i = 0; i < data.length; i++)
    {
      categories.add(Categories.fromJson(data[i]));
    }
    return categories;
  }

  void insertCategories() async{
    List<Categories> mLst = await getCategoriesFromWeb();

    for (int i = 0; i < mLst.length; i++)
    {
      Map<String, dynamic> row = {
        TblCategories.id : mLst[i].id,
        TblCategories.categoryName : mLst[i].categoryName,
        TblCategories.description : mLst[i].description,
        TblCategories.userId : mLst[i].userId,
        TblCategories.companyId : mLst[i].companyId,
        TblCategories.delStatus : mLst[i].delStatus,
      };

      final id = await categoryDbHelper.insertCategories(row);
      print('Categories return ID: $id');
    }
  }

  Future getCategories() async{
    var getAll = await categoryDbHelper.getCategories();
    print(getAll);
  }
  //#endregion

  //#region Modifiers Table
  Future<dynamic> getModifiersFromWeb() async{
    List data;
    List<Modifiers> mod = [];
    var response = await http.get(
        Uri.encodeFull("http://72.52.142.19/cloud-kitchen/api/install?auth=622780154&sale_limit=20&expense_limit=20"),
        headers: {
          "Accept" : "application/json"
        }
    );
    var resBody = json.decode(response.body);
    data = resBody["modifiers"];
    for( int i = 0; i < data.length; i++)
    {
      mod.add(Modifiers.fromJson(data[i]));
    }
    return mod;
  }

  void insertModifiers() async{
    List<Modifiers> mLst = await getModifiersFromWeb();

    for (int i = 0; i < mLst.length; i++)
    {
      Map<String, dynamic> row = {
        TblModifiers.id : mLst[i].id,
        TblModifiers.name : mLst[i].name,
        TblModifiers.price : mLst[i].price,
        TblModifiers.description : mLst[i].description,
        TblModifiers.userId : mLst[i].userId,
        TblModifiers.companyId : mLst[i].companyId,
        TblModifiers.delStatus : mLst[i].delStatus,
      };

      final id = await modifierDbHelper.insertModifiers(row);
      print('Modifiers return ID: $id');
    }
  }

  Future getModifiers() async{
    var getAll = await modifierDbHelper.getModifiers();
    print(getAll);
  }
  //#endregion

  //#region ItemMenus Table
  Future<dynamic> getItemMenusFromWeb() async{
    List data;
    List<ItemMenus> itm = [];
    var response = await http.get(
        Uri.encodeFull("http://72.52.142.19/cloud-kitchen/api/install?auth=622780154&sale_limit=20&expense_limit=20"),
        headers: {
          "Accept" : "application/json"
        }
    );
    var resBody = json.decode(response.body);
    data = resBody["item_menus"];
    for( int i = 0; i < data.length; i++)
    {
      itm.add(ItemMenus.fromJson(data[i]));
    }
    return itm;
  }

  void insertItemMenus() async{
    List<ItemMenus> mLst = await getItemMenusFromWeb();

    for (int i = 0; i < mLst.length; i++)
    {
      Map<String, dynamic> row = {
        TblItemMenus.id : mLst[i].id,
        TblItemMenus.code : mLst[i].code,
        TblItemMenus.name : mLst[i].name,
        TblItemMenus.salePrice : mLst[i].salePrice,
        TblItemMenus.photo : mLst[i].photo,
        TblItemMenus.categoryName : mLst[i].categoryName,
        TblItemMenus.percentage : mLst[i].percentage,
      };

      final id = await itmMenusDbHelper.insertItemMenus(row);
      print('Item_Menus return ID: $id');
    }
  }

  Future getItemMenus() async{
    var getAll = await itmMenusDbHelper.getItemMenus();
    print(getAll);
  }
  //#endregion

  //#region ItemModifiers Table
  Future<dynamic> getItemModifiersFromWeb() async{
    List data;
    List<ItemModifiers> itm = [];
    var response = await http.get(
        Uri.encodeFull("http://72.52.142.19/cloud-kitchen/api/install?auth=622780154&sale_limit=20&expense_limit=20"),
        headers: {
          "Accept" : "application/json"
        }
    );
    var resBody = json.decode(response.body);
    data = resBody["item_modifiers"];
    for( int i = 0; i < data.length; i++)
    {
      itm.add(ItemModifiers.fromJson(data[i]));
    }
    return itm;
  }

  void insertItemModifiers() async{
    List<ItemModifiers> mLst = await getItemModifiersFromWeb();

    for (int i = 0; i < mLst.length; i++)
    {
      Map<String, dynamic> row = {
        TblItemModifiers.id : mLst[i].id,
        TblItemModifiers.modifierId : mLst[i].modifierId,
        TblItemModifiers.foodMenuId : mLst[i].foodMenuId,
        TblItemModifiers.userId : mLst[i].userId,
        TblItemModifiers.outletId : mLst[i].outletId,
        TblItemModifiers.companyId : mLst[i].companyId,
        TblItemModifiers.delStatus : mLst[i].delStatus,
        TblItemModifiers.name : mLst[i].name,
        TblItemModifiers.price : mLst[i].price,
      };

      final id = await itmModifierDbHelper.insertItemModifier(row);
      print('Item_Modifiers return ID: $id');
    }
  }

  Future getItemModifiers() async{
    var getAll = await itmModifierDbHelper.getItemModifier();
    print(getAll);
  }
  //#endregion

  //#region Customers Table
  Future<dynamic> getCustomersFromWeb() async{
    List data;
    List<Customers> users = [];
    var response = await http.get(
        Uri.encodeFull("http://72.52.142.19/cloud-kitchen/api/install?auth=622780154&sale_limit=20&expense_limit=20"),
        headers: {
          "Accept" : "application/json"
        }
    );
    var resBody = json.decode(response.body);
    data = resBody["users"];
    for( int i = 0; i < data.length; i++)
    {
      users.add(Customers.fromJson(data[i]));
    }
    print(users);
    return users;
  }

  void insertCustomers() async{
    List<Customers> mLst = await getCustomersFromWeb();

    for (int i = 0; i < mLst.length; i++)
    {
      Map<String, dynamic> row = {
        TblCustomers.id : mLst[i].id,
        TblCustomers.name : mLst[i].name,
        TblCustomers.phone : mLst[i].phone,
        TblCustomers.email : mLst[i].email,
        TblCustomers.address : mLst[i].address,
        TblCustomers.gstNumber : mLst[i].gstNumber,
        TblCustomers.areaId : mLst[i].areaId,
        TblCustomers.userId : mLst[i].userId,
        TblCustomers.companyId : mLst[i].companyId,
        TblCustomers.delStatus : mLst[i].delStatus,
        TblCustomers.dateOfBirth : mLst[i].dateOfBirth,
        TblCustomers.dateOfAnniversary : mLst[i].dateOfAnniversary,

      };
      final id = await customerDbHelper.insertCustomer(row);
      print('Customer return ID: $id');
    }
  }

  Future getCustomers() async{
    var getAll = await customerDbHelper.getCustomer();
    print(getAll);
  }
  //#endregion


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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              children: [
//                RaisedButton(
//                  onPressed: insertRow,
//                  child: Text("Insert"),
//                ),
//
//                RaisedButton(
//                  onPressed: getAll,
//                  child: Text("Get List"),
//                ),
//              ],
//            ),
//            RaisedButton(
//              onPressed: getSp,
//              child: Text("Get distinct"),
//            ),
//            RaisedButton(
//              onPressed: mixList,
//              child: Text("Get Sp. List"),
//            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                onPressed: insertCompany,
                child: Text("Insert Company"),
              ),
              RaisedButton(
                onPressed: getCompanies,
                child: Text("Get Company"),
              ),
            ],
          ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: insertOutlet,
                  child: Text("Insert Outlet"),
                ),
                RaisedButton(
                  onPressed: getOutlets,
                  child: Text("Get Outlet"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: insertUser,
                  child: Text("Insert User"),
                ),
                RaisedButton(
                  onPressed: getUsers,
                  child: Text("Get Users"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: insertTable,
                  child: Text("Insert Table"),
                ),
                RaisedButton(
                  onPressed: getTables,
                  child: Text("Get Tables"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: insertCategories,
                  child: Text("Insert Categories"),
                ),
                RaisedButton(
                  onPressed: getCategories,
                  child: Text("Get Categories"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: insertModifiers,
                  child: Text("Insert Modifiers"),
                ),
                RaisedButton(
                  onPressed: getModifiers,
                  child: Text("Get Modifiers"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: insertItemMenus,
                  child: Text("Insert ItemMenus"),
                ),
                RaisedButton(
                  onPressed: getItemMenus,
                  child: Text("Get ItemMenus"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: insertItemModifiers,
                  child: Text("Insert ItemModifiers"),
                ),
                RaisedButton(
                  onPressed: getItemModifiers,
                  child: Text("Get ItemModifiers"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: insertCustomers,
                  child: Text("Insert Customers"),
                ),
                RaisedButton(
                  onPressed: getCustomers,
                  child: Text("Get Customers"),
                ),
              ],
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