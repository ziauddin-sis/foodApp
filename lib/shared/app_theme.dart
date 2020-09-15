// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:logger/logger.dart';
// import 'package:progress_dialog/progress_dialog.dart';
// import 'package:sales_force/shared/config.dart';
// import 'package:auto_size_text/auto_size_text.dart';

// class AppTheme {
//   static Logger _log = Config.log;
//   static const Color appThemeColor = Colors.blue;
//   static const Color redColor = Color.fromRGBO(251, 91, 57, 0.7);
//   static const Color blueColor = Color.fromRGBO(145, 202, 245, 0.6);
//   static const String backgroundImage = 'images/salesPattern2.jpg';
//   static const Color ddfColor = Color.fromRGBO(242, 235, 243, 1.0);
//   static Color backgroundColor = Colors.grey[200];

//   static ProgressDialog showProgressDialog(BuildContext context,
//       {String text = '', bool isDismissible = true}) {
//     final spinKit = new SpinKitFadingCube(
//       itemBuilder: (context, index) => DecoratedBox(
//         decoration: BoxDecoration(color: AppTheme.appThemeColor),
//       ),
//     );
//     ProgressDialog progressDialog = ProgressDialog(context,
//         type: ProgressDialogType.Normal,
//         isDismissible: false,
//         customBody: Container(
//           color: Colors.transparent,
//           height: 250,
//           width: 100,
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 spinKit,
//                 SizedBox(
//                   height: 30,
//                 ),
//                 AppTheme.text(text: 'Loading...')
//               ]),
//         ));
//     return progressDialog;
//   }

//   static Future<DateTime> datePicker(BuildContext context) async {
//     DateTime dateTime = DateTime.now();
//     return showDatePicker(
//         context: context,
//         initialDate: dateTime,
//         firstDate: dateTime,
//         lastDate:
//             new DateTime(dateTime.year + 1, dateTime.month, dateTime.day));
//   }

//   static Future<TimeOfDay> timePicker(BuildContext context) async {
//     return showTimePicker(context: context, initialTime: TimeOfDay.now());
//   }

//   static Widget autoTextSizeWidget(String text,
//       {double fontSize,
//       FontWeight fontWeight,
//       double minFontSize = 16,
//       double maxFontSize = 16,
//       Color fontColor}) {
//     return AutoSizeText(
//       text,
//       style: TextStyle(
//           fontSize: fontSize, fontWeight: fontWeight, color: fontColor),
//       minFontSize: minFontSize,
//       maxFontSize: maxFontSize,
//     );
//   }

//   static RaisedButton rectangleRaisedButton(
//       {Color color = Colors.white,
//       String text,
//       double fontSize = 18,
//       Function onPressed}) {
//     return new RaisedButton(
//         color: Colors.blue,
//         onPressed: onPressed,
//         child: AppTheme.text(text: text, fontSize: fontSize, color: color));
//   }

//   static RaisedButton roundRaisedButton(
//       {Color color = Colors.white,
//       String text,
//       double fontSize = 18,
//       Function onPressed,
//       double borderRadius = 30.0}) {
//     return new RaisedButton(
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(borderRadius)),
//       color: Colors.blue,
//       child: Text(
//         text,
//         style: TextStyle(color: color, fontSize: fontSize),
//       ),
//       onPressed: onPressed,
//     );
//   }

//   static RaisedButton recRaisedButton(
//       {String text,
//       Color textColor = Colors.white,
//       Color buttonColor = Colors.blue,
//       Function onPressed}) {
//     return RaisedButton(
//       child: Text(
//         text,
//         style: TextStyle(color: textColor),
//       ),
//       color: buttonColor,
//       onPressed: onPressed,
//     );
//   }

//   static AppBar appBar({String title = 'NoTitle'}) {
//     return AppBar(
//       title: Text(title),
//     );
//   }

//   static Widget card({Widget child}) {
//     return Card(
//         child: Padding(
//       padding: EdgeInsets.all(8.0),
//       child: child,
//     ));
//   }

//   static TextStyle textStyle(
//       {double fontSize = 18,
//       FontWeight fontWeight = FontWeight.normal,
//       Color color = Colors.black}) {
//     return TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);
//   }

//   static Card roundIconButton(
//       {String text,
//       TextStyle textStyle,
//       Color buttonColor,
//       Icon icon,
//       double iconSize,
//       Function onPressed}) {
//     return Card(
//       color: buttonColor,
//       shape: CircleBorder(),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           IconButton(
//             iconSize: iconSize,
//             icon: icon,
//             onPressed: onPressed,
//           ),
//           AutoSizeText(
//             text,
//             style: textStyle,
//             minFontSize: 14,
//             maxFontSize: 18,
//           ),
//         ],
//       ),
//     );
//   }

//   static Text text(
//       {String text,
//       double fontSize = 15,
//       FontWeight fontWeight = FontWeight.normal,
//       Color color = Colors.black}) {
//     return Text(
//       text,
//       style:
//           textStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
//     );
//   }

//   static void showAlertDialog(BuildContext context,
//       {String title,
//       FontWeight fontWeight,
//       double fontSize,
//       Widget content,
//       List<FlatButton> buttons}) {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) => AlertDialog(
//               title: Container(
//                   child: Text(title,
//                       style: textStyle(
//                           fontWeight: fontWeight, fontSize: fontSize))),
//               content: content,
//               actions: buttons,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8)),
//             ));
//   }

//   static Widget imageButton(String imagePath, double scale,
//       {Function onPressed}) {
//     try {
//       return GestureDetector(
//         onTap: onPressed,
//         child: Image.asset(
//           imagePath,
//           scale: scale,
//         ),
//       );
//     } catch (e) {
//       _log.e('ERROR ON AppTheme imageButton', [e]);
//       return Text('error');
//     }
//   }

//   static void showDialogBox(BuildContext context,
//       {String title, String message, List<FlatButton> buttons}) {
//     showDialog(
//         context: context,
//         builder: (value) => AlertDialog(
//               title:
//                   text(text: title, fontWeight: FontWeight.bold, fontSize: 20),
//               content: text(text: message),
//               actions: buttons,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8)),
//             ));
//   }

//   static void showAlertDialogOK(BuildContext context,
//       {String title, String message, Function onOK}) {
//     showDialog(
//         context: context,
//         builder: (value) => AlertDialog(
//               title:
//                   text(text: title, fontWeight: FontWeight.bold, fontSize: 20),
//               content: text(text: message),
//               actions: [
//                 FlatButton(
//                     child: text(text: 'OK', color: Colors.blue),
//                     onPressed: onOK),
//               ],
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8)),
//             ));
//   }

//   static void showAlertDialogYN(BuildContext context,
//       {String title, String message, Function onYes, Function onNo}) {
//     showDialog(
//         context: context,
//         builder: (value) => AlertDialog(
//             title: text(text: title, fontWeight: FontWeight.bold, fontSize: 20),
//             content: text(text: message),
//             actions: [
//               FlatButton(
//                   child: text(text: 'Yes', color: Colors.blue),
//                   onPressed: onYes),
//               FlatButton(
//                   child: text(text: 'No', color: Colors.blue), onPressed: onNo)
//             ],
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8))));
//   }

//   static void showPleaseWait(BuildContext context) {
//     showDialog(
//         context: context,
//         builder: (value) => AlertDialog(
//               title: text(
//                   text: 'Please Wait',
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20),
//               content: Center(
//                 child: SpinKitRotatingCircle(),
//               ),
//             ));
//   }

//   static Widget loadNetworkImage(
//       {String url, double height, double width, BoxFit boxFit = BoxFit.fill}) {
//     return Image.network(url,
//         height: height,
//         width: width,
//         fit: boxFit,
//         alignment: Alignment.center, loadingBuilder: (BuildContext context,
//             Widget child, ImageChunkEvent loadingProgress) {
//       if (loadingProgress == null) return child;
//       return Center(
//         child: CircularProgressIndicator(
//           value: loadingProgress.expectedTotalBytes != null
//               ? loadingProgress.cumulativeBytesLoaded /
//                   loadingProgress.expectedTotalBytes
//               : null,
//         ),
//       );
//     });
//   }
// }
