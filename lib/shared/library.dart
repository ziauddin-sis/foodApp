// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'package:crypto/crypto.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart';
// import 'package:intl/intl.dart';
// import 'package:logger/logger.dart';
// import 'package:path/path.dart';
// import 'package:sales_force/Json_data_models/install_api.dart';
// import 'package:sales_force/shared/config.dart';
// import 'package:sales_force/models/user.dart';
// import 'package:sales_force/pages/dashboard_page.dart';
// import 'package:sales_force/sql/dal.dart';
// import 'package:sales_force/sql/database.dart';
// import 'package:sales_force/sql/import_data.dart';
// import 'package:sales_force/sql/select_queries.dart';
// import 'package:sqflite/sqflite.dart';

// class Library {
//   static Logger _log = Config.log;

//   static Future<bool> isLocationEnabled() async {
//     return await Geolocator().isLocationServiceEnabled();
//   }

//   static Future<bool> hasDatabase() async {
//     bool isDatabaseReady = false;
// //    Library.getDatabase()
// //        .then((db) => db.rawQuery("select name from sqlite_master where type = 'table' and name = 'users'").then((value) => value.forEach((e) => print('>>>$e\n'))));
//     List<dynamic> list = await Library.getDatabase().then((db) => db.rawQuery(
//         "select name from sqlite_master where type = 'table' and name = 'users'"));
//     isDatabaseReady = list.isNotEmpty;
//     return isDatabaseReady;
//   }

//   static void loadUserData(String email) {
//     DAL.staticDal = new DAL(email: email);
//   }

//   static Future<bool> hasServerAccess() async {
//     try {
//       final result = await InternetAddress.lookup(Config.serverAddress)
//           .timeout(Duration(seconds: 5), onTimeout: () => null)
//           .catchError((onError) => null);
//       if (result != null) {
//         if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//           //log.v('GAINED SERVER ACCESS');
//           return true;
//         } else {
//           //log.v('LOST SERVER ACCESS');
//           return false;
//         }
//       } else {
//         _log.w('SERVER OFFLINE');
//         return false;
//       }
//     } catch (e) {
//       _log.e('ERROR ON LIBRARY hasServerAccess', [e]);
//       return false;
//     }
//   }

//   static String getDateTime() {
//     DateFormat formatter = new DateFormat('yyyy-MM-dd HH:mm:ss');
//     return formatter.format(DateTime.now());
//   }

//   static String getDate() {
//     DateFormat formatter = new DateFormat('yyyy-MM-dd');
//     return formatter.format(DateTime.now());
//   }

//   static getDatabasePath() async {
//     String dbStorage = await getDatabasesPath();
//     return join(dbStorage, Config.DATABASE_NAME);
//   }

//   static firstRun() async {
//     if (await fetchData()) {
//       Install();
//     }
//   }

//   static fetchData() async {
//     try {
//       String url = Config.installAPILink;
//       Response response = await get(url);
//       _log.v('ENTRY fetchData');
//       _log.v('SERVER RESPONSE: ${response.statusCode}');
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         _log.i('STATUS:\n${data['status']}');
//         _log.i('MESSAGE:\n${data['message']}');
//         ApiInstall(
//             status: data['status'].toString(),
//             message: data['message'].toString(),
//             data: data['data']);
//       }
//       return true;
//     } catch (e) {
//       print(e.toString());
//       return false;
//     }
//   }

//   static Future<User> getLoggedInUser() async {
//     try {
//       String query = "${Select.selectUser} where login_status = 1";
//       Database db = await getDatabase();
//       List<Map<String, dynamic>> data = await db.rawQuery(query);

//       if (data.isNotEmpty) {
//         Map e = data[0];
//         User user = new User(
//             user_id: e['user_id'],
//             user_type_id: e['user_type_id'],
//             distributor_id: e['distributor_id'],
//             firstname: e['user_first_name'],
//             lastname: e['user_last_name'],
//             email: e['user_email_address'],
//             password: e['user_password'],
//             phoneNumber: e['user_phone_number'],
//             mobile: e['user_mobile'],
//             user_status: e['user_status'],
//             createdon: e['createdon'],
//             modifiedon: e['modifiedon'],
//             discountPercent: e['discount_percent']);
//         return user;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       _log.e('ERROR ON getLoggedInUser', [e]);
//       return null;
//     }
//   }

//   static Future<User> getUser(String email) async {
//     User user;
//     Database db = await getDatabase();
//     List<Map<String, dynamic>> listMap = await db
//         .rawQuery('${Select.selectUser} where user_email_address = ?', [email]);
//     user = new User.withQueryResult(listMap);
//     return user;
//   }

//   static isLoggedIn(String email) async {
//     try {
//       bool response = false;
//       Database db = await getDatabase();
//       String table = 'users';
//       List<String> columns = ['login_status'];
//       String where = 'user_email_address = ?';
//       List<String> whereArgs = [email];
//       List<Map<String, dynamic>> xx = await db.query(table,
//           columns: columns, where: where, whereArgs: whereArgs);
//       if (xx.isNotEmpty) {
//         if (xx[0]['login_status'].toString() == '1')
//           response = true;
//         else
//           response = false;
//       } else {
//         response = false;
//       }
//       return response;
//     } catch (e) {
//       _log.e('ERROR ON isLoggedIn', [e]);
//       return false;
//     }
//   }

//   static Future<Database> getDatabase() async {
//     String dbStorage = await getDatabasesPath();
//     String path = join(dbStorage, Config.DATABASE_NAME);
//     Future<Database> fDB = openDatabase(path, singleInstance: false);
//     return fDB;
//   }

//   static Future<bool> validateUser(String email, String password) async {
//     try {
//       List<int> xx = utf8.encode(password);
//       Digest digest = md5.convert(xx);
//       password = digest.toString();
//       Database db = await getDatabase();
//       String table = 'users';
//       List<String> columns = ['id'];
//       String where = 'user_email_address = ? and user_password = ?';
//       List<String> whereArgs = [email, password];
//       List<Map> x = await db.query(table,
//           columns: columns, where: where, whereArgs: whereArgs);
//       if (x.isNotEmpty) {
//         login(email);
//         return true;
//       } else {
//         return false;
//       }
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   static logout(String userId) async {
//     Database db = await Library.getDatabase();
//     db.update('users', {'login_status': '0'},
//         where: 'user_id = ?', whereArgs: [userId]);
//   }

//   static login(String email) async {
//     try {
//       Database db = await Library.getDatabase();
//       Map<String, dynamic> map = new Map<String, dynamic>();
//       map['login_status'] = 1;
//       int value = await db.update('users', map,
//           where: 'user_email_address = ?', whereArgs: [email]);
//       _log.v('USER LOGGED-IN: $value');

// //    int x = await db.update('users', map,
// //        where: 'user_email_address = ?', whereArgs: [email]);
// //    print('USER LOGGED-IN: $x');
//     } catch (e) {
//       _log.e('ERROR ON LIBRARL Login', [e]);
//     }
//   }

//   static writeToDatabase() async {
//     new ImportToDB('INSTALLAPI');
//   }

//   static Future<bool> uploadToServer(String url, {String jsonString}) async {
//     try {
//       bool status = false;
//       Response onPost;
//       Map<String, String> header = {
//         'content-type': 'application/x-www-form-urlencoded'
//       };
//       bool hasServerAccess = await Library.hasServerAccess();
//       if (jsonString != null && hasServerAccess) {
//         onPost = await post(url, headers: header, body: {'json': jsonString})
//             .timeout(
//               Duration(seconds: 5),
//               onTimeout: () => null,
//             )
//             .catchError(
//                 (onError) => _log.e('ERROR ON uploadToServer', [onError]));

// //    if (url == Config.putTrackingAPILink) log.v('LOCATION SENT');
// //    if (url == Config.putInvoiceAPILink) log.v('INVOICE SENT');
// //    if (url == Config.putOrderVisitAPILink) log.v('ORDER SENT');
// //    if (url == Config.putOrderVisitAPILink) log.v('VISIT SENT');
//         if (onPost != null) {
//           Map response = jsonDecode(onPost.body);
//           //_log.i('ENTRY SERVER UPLOAD');
//           //print('STATUS CODE: ${onValue.statusCode}');
//           _log.i(
//               'SERVER REPLY\nSTATUS: ${response['status'].toString().toUpperCase()}\nDATA: ${response['data']}');
//           if (response['status'].toString().contains('success')) status = true;
//           //print('MESSAGE: ${response['message'].toString().toUpperCase()}');
//           //log.i('DATA: ${response['data']}');
//           //_log.i('EXIT SERVER UPLOAD');
//         }
//       }
//       return status;
//     } catch (e) {
//       _log.wtf('ERROR ON uploadToServer', [e]);
//       return false;
//     }
//   }

//   static void updateData() async {
//     if (await fetchData()) {
//       Reinstall();
//     }
//   }

//   static resetViewToDashBoard(BuildContext context) {
//     Navigator.of(context).pushAndRemoveUntil(
//         new MaterialPageRoute(
//             builder: (context) => new Dashboard(DAL.currentUser)),
//         (route) => false);
//   }

//   static getLocation() async {
//     if (await Geolocator().isLocationServiceEnabled()) {
//       return await Geolocator().getCurrentPosition();
//     }
//   }
// }
