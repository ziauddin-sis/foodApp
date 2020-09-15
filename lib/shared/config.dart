import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class Config {
  // ignore: non_constant_identifier_names
  static int DATABASE_BASE_VERSION;
  static const int DATABASE_VERSION = 29;
  static const String DATABASE_NAME = 'SaleForce.db';
  // ignore: non_constant_identifier_names
  static Database DATABASE;
  // ignore: non_constant_identifier_names
  static String DATABASES_PATH;
  // ignore: non_constant_identifier_names
  static String DATABASE_PATH;

  static const String serverAddress = '72.52.142.19';
  static const String apiPrefix =
      'http://$serverAddress/ddf-pvt-ltd/webservice/';
  static const String installAPILink = apiPrefix + 'api.php?action=install';
  static String putInvoiceAPILink =
      apiPrefix + 'api.php?action=put&module=invoice_payment&user=1';

  static String putOrderVisitAPILink =
      apiPrefix + 'api.php?action=put&module=visit_order&user=1';
  static String putTrackingAPILink =
      apiPrefix + 'api.php?action=put&module=tracking&user=1';
  static String syncAPILink = apiPrefix + 'api.php?action=sync&createdon=';
  static const int serviceCycleDelay = 10; //seconds
  static const int splashTimeOut = 5; //seconds
  static double deviceDisplayWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double deviceDisplayHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static final Logger log = new Logger(
      printer: PrettyPrinter(
          colors: true,
          errorMethodCount: 1,
          printEmojis: true,
          printTime: false,
          lineLength: 80,
          methodCount: 0));
}
