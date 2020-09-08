import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_app/database/db_main.dart';
import 'package:food_app/database/tables/tbl_categories.dart';
import 'package:food_app/database/tables/tbl_company.dart';
import 'package:food_app/database/tables/tbl_customers.dart';
import 'package:food_app/database/tables/tbl_item_menus.dart';
import 'package:food_app/database/tables/tbl_item_modifiers.dart';
import 'package:food_app/database/tables/tbl_modifiers.dart';
import 'package:food_app/database/tables/tbl_outlet.dart';
import 'package:food_app/database/tables/tbl_tables.dart';
import 'package:food_app/database/tables/tbl_user.dart';
import 'package:food_app/lists/menu-list.dart';
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
import 'package:progress_dialog/progress_dialog.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final globalScaffoldKey = GlobalKey<ScaffoldState>();

  final companyDbHelper = TblCompany.instance;
  final outletDbHelper = TblOutlet.outletInstance;
  final userDbHelper = TblUsers.usersInstance;
  final tableDbHelper = TblTables.tablesInstance;
  final categoryDbHelper = TblCategories.categoriesInstance;
  final modifierDbHelper = TblModifiers.modifiersInstance;
  final itmMenusDbHelper = TblItemMenus.itemMenusInstance;
  final itmModifierDbHelper = TblItemModifiers.itemModifiersInstance;
  final customerDbHelper = TblCustomers.customersInstance;

  ProgressDialog _progressDialog;
  String _msg = 'Downloading..';
  bool _isProgress = true;
  bool _isUpdate = true;

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

  Future insertCompany() async{
    List<Company> myRow = await getCompanyFromWeb();
//    setState(() {
//      _msg = "Adding Company Table";
//      _isProgress = true;
//    });
//    _progressDialog.update(message: "Adding Company Table");
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
//    _progressDialog.update(message: "Added Company Table");

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

  Future insertOutlet() async{
    List<Outlet> mLst = await getOutletFromWeb();
//    setState(() {
//      _msg = "Adding Outlet Table";
//      _isProgress = true;
//    });
//    _progressDialog.update(message: "Adding Outlet Table");

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
//    _progressDialog.update(message: "Added Outlet Table");

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

  Future insertUser() async{
    List<Users> mLst = await getUsersFromWeb();
//    setState(() {
//      _msg = "Adding Company Table";
//      _isProgress = true;
//    });
//    _progressDialog.update(message: "Adding Users Table");

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
//    _progressDialog.update(message: "Added Users Table");

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

  Future insertTable() async{
    List<Tables> mLst = await getTablesFromWeb();
//    setState(() {
//      _msg = "Adding Tables Table";
//      _isProgress = true;
//    });
//    _progressDialog.update(message: "Adding Tables Table");

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
//    _progressDialog.update(message: "Added Tables Table");

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

  Future insertCategories() async{
    List<Categories> mLst = await getCategoriesFromWeb();
//    setState(() {
//      _msg = "Adding Categories Table";
//      _isProgress = true;
//    });
//    _progressDialog.update(message: "Adding Categories Table");

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
//    _progressDialog.update(message: "Added Categories Table");

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

  Future insertModifiers() async{
    List<Modifiers> mLst = await getModifiersFromWeb();
//    setState(() {
//      _msg = "Adding Modifiers Table";
//      _isProgress = true;
//    });
//    _progressDialog.update(message: "Adding Modifiers Table");

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
//    _progressDialog.update(message: "Added Modifiers Table");

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

  Future insertItemMenus() async{
    List<ItemMenus> mLst = await getItemMenusFromWeb();
//    setState(() {
//      _msg = "Adding Item Menus Table";
//      _isProgress = true;
//    });
//    _progressDialog.update(message: "Adding Item Menus Table");

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
//    _progressDialog.update(message: "Added Item Menus Table");

  }

  Future getItemMenus() async{
    var getAll = await itmMenusDbHelper.getItemMenus();
//    print(getAll);
    return getAll;
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

  Future insertItemModifiers() async{
    List<ItemModifiers> mLst = await getItemModifiersFromWeb();
//    setState(() {
//      _msg = "Adding Item Modifiers Table";
//      _isProgress = true;
//    });
//    _progressDialog.update(message: "Adding Item Modifiers Table");

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
//    _progressDialog.update(message: "Added Item Modifiers Table");

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

  Future insertCustomers() async{
    List<Customers> mLst = await getCustomersFromWeb();
//    setState(() {
//      _msg = "Adding Customers Table";
//      _isProgress = true;
//    });
//    _progressDialog.update(message: "Adding Customers Table");

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
//    _progressDialog.update(message: "Added Customers Table");

  }

  Future getCustomers() async{
    var getAll = await customerDbHelper.getCustomer();
    print(getAll);
  }
  //#endregion


  @override
  Widget build(BuildContext context) {

    _progressDialog = ProgressDialog(context, type: ProgressDialogType.Normal, isDismissible: false);

    Future _showProgressDialogue() async{
      _progressDialog.style(
        message: _msg,
        progressTextStyle: TextStyle(
          fontSize: 3,
        ),
        borderRadius: 5.0,
        backgroundColor: Colors.white,
        progressWidget: Container(
          padding: EdgeInsets.all(10.0),
          child: CircularProgressIndicator(
            strokeWidth: 5,
            backgroundColor: Colors.yellow[300],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
          ),
        ),
        elevation: 10.0,
      );
      await _progressDialog.show();
    }

    Future _hideProgressDialog() async{
      await _progressDialog.hide();
    }

    Future _downloadingServices() async{

      await _showProgressDialogue();

      _progressDialog.update(message: "Adding Company Table");
      await insertCompany();
      _progressDialog.update(message: "Added Company Table");

      _progressDialog.update(message: "Adding Outlet Table");
      await insertOutlet();
      _progressDialog.update(message: "Added Outlet Table");

      _progressDialog.update(message: "Adding Users Table");
      await insertUser();
      _progressDialog.update(message: "Added Users Table");

      _progressDialog.update(message: "Adding Tables Table");
      await insertTable();
      _progressDialog.update(message: "Added Tables Table");

      _progressDialog.update(message: "Adding Categories Table");
      await insertCategories();
      _progressDialog.update(message: "Added Categories Table");

      _progressDialog.update(message: "Adding Modifiers Table");
      await insertModifiers();
      _progressDialog.update(message: "Added Modifiers Table");

      _progressDialog.update(message: "Adding ItemMenus Table");
      await insertItemMenus();
      _progressDialog.update(message: "Added ItemMenus Table");

      _progressDialog.update(message: "Adding ItemModifiers Table");
      await insertItemModifiers();
      _progressDialog.update(message: "Added ItemModifiers Table");

      _progressDialog.update(message: "Adding Customers Table");
      await insertCustomers();
      _progressDialog.update(message: "Added Customers Table");

      await _hideProgressDialog();

//      setState(() {
//        _msg = "Done..";
//        _isProgress = false;
//      });
//      if(!_isProgress)
//      {
//      }
    }

    Future.delayed(Duration(seconds: 2), () async{
//      setState(() async {
        List items = await getItemMenus();
        if(items.length > 0){
          await Navigator.of(context).pushReplacementNamed('/ul');
        }
        else{
          await _downloadingServices();
          await Navigator.of(context).pushReplacementNamed('/ul');
        }
//      });
    }
    );

    return Scaffold(
      backgroundColor: Colors.yellow[600],
      key: globalScaffoldKey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.bottomCenter,
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/splash_pic.png'),
                    fit: BoxFit.contain,
                  ),
                ),
            ),
            Text(
              'My Food',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                fontFamily: 'Ubuntu',
                color: Colors.red,
                letterSpacing: 3.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


