import 'package:food_app/testing/columnTypes.dart';
import 'package:food_app/testing/columns.dart';
import 'package:food_app/testing/table.dart' as T;
import 'package:sqflite/sqflite.dart';

class Tables {
  // CREATE A STRING VARIABLE OF THE TABLE NAME AND ADD THE VARIABLE TO
  // tables LIST
  static const List<String> tables = [
    _users,
    _userTypes,
    _categories,
    _products,
    _invoices,
    _salesman,
    _appSettings,
    _productPrices,
    _customerGroups,
    _customer,
    _orderMaster,
    _orderDetail
  ];
  static const String _users = 'users';
  static const String _userTypes = 'users_types';
  static const String _categories = 'categories';
  static const String _products = 'products';
  static const String _invoices = 'invoices';
  static const String _salesman = 'salesman';
  static const String _appSettings = 'app_settings';
  static const String _productPrices = 'product_prices';
  static const String _customerGroups = 'customer_groups';
  static const String _customer = 'customer';
  static const String _orderMaster = 'order_master';
  static const String _orderDetail = 'order_detail';
  static List<T.Table> getTables(Database db) {
    List<T.Table> tables = [];
    for (int i = 0; i < tables.length; i++) {
      tables.add(new T.Table(
          name: Tables.tables[i],
          columnNames: Columns.columns[i],
          columnTypes: ColumnTypes.columnTypes[i],
          db: db));
    }
    return tables;
  }
  // static const T.Table users = const T.Table(
  //     name: _users, columnNames: Columns.users, columnTypes: ColumnTypes.users);
  // static const T.Table userTypes = const T.Table(
  //     name: _userTypes,
  //     columnNames: Columns.userTypes,
  //     columnTypes: ColumnTypes.userTypes);
  // static const T.Table categories = const T.Table(
  //     name: _categories,
  //     columnNames: Columns.categories,
  //     columnTypes: ColumnTypes.categories);
  // static const T.Table products = const T.Table(
  //     name: _products,
  //     columnNames: Columns.products,
  //     columnTypes: ColumnTypes.products);
  // static const T.Table invoices = const T.Table(
  //     name: _invoices,
  //     columnNames: Columns.invoices,
  //     columnTypes: ColumnTypes.invoices);
  // static const T.Table salesman = const T.Table(
  //     name: _salesman,
  //     columnNames: Columns.salesman,
  //     columnTypes: ColumnTypes.salesman);
  // static const T.Table appSettings = T.Table(
  //     name: _appSettings,
  //     columnNames: Columns.appSettings,
  //     columnTypes: ColumnTypes.appSettings);
  // static const T.Table productPrices = const T.Table(
  //     name: _productPrices,
  //     columnNames: Columns.productPrices,
  //     columnTypes: ColumnTypes.productPrices);
  // static const T.Table customerGroups = const T.Table(
  //     name: _customerGroups,
  //     columnNames: Columns.customerGroups,
  //     columnTypes: ColumnTypes.customerGroups);
  // static const T.Table customer = const T.Table(
  //     name: _customer,
  //     columnNames: Columns.customer,
  //     columnTypes: ColumnTypes.customer);
  // static const T.Table orderMaster = const T.Table(
  //     name: _orderMaster,
  //     columnNames: Columns.orderMaster,
  //     columnTypes: ColumnTypes.orderMaster);
  // static const T.Table orderDetail = const T.Table(
  //     name: _orderDetail,
  //     columnNames: Columns.orderDetail,
  //     columnTypes: ColumnTypes.orderDetail);
}
