//Future<String> apiRequest(String url, Map jsonMap) async {
//  HttpClient httpClient = new HttpClient();
//  HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
//  request.headers.set('content-type', 'application/json');
//  request.add(utf8.encode(json.encode(jsonMap)));
//  HttpClientResponse response = await request.close();
//  // todo - you should check the response.statusCode
//  String reply = await response.transform(utf8.decoder).join();
//  httpClient.close();
//  return reply;
//}


//TextFormField
//(
//initialValue: chequeDate,onTap: (
//)
//async {
//
//DateTime selectedDate = await
//showDatePicker
//(
//context: context,initialDate: DateTime.now()
//,
//firstDate: DateTime
//(2020,
//01
//)
//,
//lastDate: DateTime
//(2050)
//);
//if
//(
//selectedDate != null
//&&
//selectedDate != selectedDate)chequeDate = selectedDate.toLocal()
//.
//
//toString();
//setState
//(() {});
//}
//,
//decoration: InputDecoration
//(
//hintText: '
//Cheque Date
//'
//)
//,
//onSaved: (
//value) =>
//chequeDate = value,validator: (
//value) {
//return chequeDateValidation(value);
//},
//)
//,
//)