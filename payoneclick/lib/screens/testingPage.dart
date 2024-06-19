// import 'dart:convert';
// import 'dart:js';
//
//
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
// import 'package:payoneclick/Api_Services/Api_Service.dart';
// import 'package:html/parser.dart' show parse;
//
//
//
//
//
// class Testingpage extends StatefulWidget {
//
//   final bool showStateTextField;
//
//   const Testingpage({Key? key, this.showStateTextField = true,
//
//   }): super(key: key);
//
//   @override
//   State<Testingpage> createState() => _TestingpageState();
// }
//
// class _TestingpageState extends State<Testingpage> {
//   List<String> txnIDs = []; // List to store TxnIDs
//   List<String> number=[];
//   List<double> payableAmount= [];
//   List<num> amount = [];
//   List<num> openingBalance = [];
//   List<num> commission = [];
//   List<String> txnDate = [];
//   List<String> operatorName = [];
//   List<String>oPImage = [];
//   List<String>sTATUS = [];
//   List<String> liveID=[];
//   List<double> closingBalance =[];
//
//
//   @override
//   void initState() {
//     super.initState();
//     // Call the function to fetch data when the widget is initialized
//     fetchData();
//   }
//
//   // Function to fetch data
//   Future<void> fetchData() async {
//     // Replace these values with your actual userID and serviceID
//     String userID = 'AhCtz8JqpO4FdfEQaakgb1unsKFHQMXB';
//     String serviceID = '1';
//
//     // Call your API service method to get recharge report
//     var apiService = ApiServices();
//     var result = await apiService.getRechargeReport(userID, serviceID);
//
//     // If result is not null and contains data
//     if (result != null && result.data != null) {
//       setState(() {
//         // Extracting all TxnIDs
//         txnIDs = result.data!.map((report) => report.txnID!).toList();
//         number = result.data!.map((report) => report.number!).toList();
//         payableAmount = result.data!.map((report) => report.payableAmount!).toList();
//         amount = result.data!.map((report) => report.amount!).toList();
//         openingBalance = result.data!.map((report) => report.openingBalance!).toList();
//         commission = result.data!.map((report) => report.commission!).toList();
//         txnDate = result.data!.map((report) => report.txnDate!).toList();
//         operatorName = result.data!.map((report) => report.operatorName!).toList();
//         oPImage = result.data!.map((report) => report.oPImage!).toList();
//         sTATUS = result.data!.map((report) => report.sTATUS!).toList();
//         liveID = result.data!.map((report) => report.liveID!).toList();
//         closingBalance = result.data!.map((report) => report.closingBalance!).toList();
//
//
//
//       });
//     }
//     // Debugging information
//     print('txnIDs length: ${txnIDs.length}');
//     print('number length: ${number.length}');
//     print('payableAmount length: ${payableAmount.length}');
//     print('payableAmount length: ${amount.length}');
//
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: txnIDs.isNotEmpty && number.isNotEmpty && payableAmount.isNotEmpty
//           ? ListView.builder(
//         itemCount: txnIDs.length,
//         itemBuilder: (context, index) {
//           // Ensure index is within valid range
//           if (index < txnIDs.length && index < number.length && index < payableAmount.length) {
//             return Card(
//              child:   Column(
//                 children: [
//                   Text('TxnID: ${txnIDs[index]}'),
//                   Text('Number: ${number[index]}'),
//                   Text('PayableAmount: ${payableAmount[index]}'),
//                   Text('Amount: ${amount[index]}'),
//                   Text('OpeningBalance: ${openingBalance[index]}'),
//                   Text('Commission: ${commission[index]}'),
//                   _buildDateTimeText(txnDate[index]), // Use a hel
//                   Text('OperatorName : ${operatorName[index]}'),
//                   Image.network(
//                     "http://login.payonclick.in${oPImage[index]}",height: 20,width: 20,
//                     errorBuilder: (context, error, stackTrace) {
//                       return Text('image nai aa rhe hai'); // Handle errors gracefully
//                     },
//                     loadingBuilder: (context, child, loadingProgress) {
//                       if (loadingProgress == null) {
//                         return child;
//                       }
//                       return Center(
//                         child: CircularProgressIndicator(
//                           value: loadingProgress.expectedTotalBytes != null
//                               ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
//                               : null,
//                         ),
//                       );
//                     },
//                   ),
//                   _buildStatusText(sTATUS[index]), // Use a helper method to style the status text
//                   Text('LiveID : ${liveID[index]}'),
//                   Text('ClosingBalance : ${closingBalance[index]}'),
//
//
//
//                 ],
//               ),
//
//
//             );
//           } else {
//             return SizedBox(); // Return an empty widget if index is out of range
//           }
//         },
//       )
//         : Center(child: CircularProgressIndicator(), // Show progress indicator while loading
//               ),
//     );
//
//   }
//
//   Widget _buildStatusText(String statusHtml) {
//     // Parse the HTML content to extract text and color
//     var document = parse(statusHtml);
//     var statusText = document.body!.text;
//     var statusColor = Colors.green;
//
//     // Determine color based on the status text
//     if (statusHtml.contains("color:green")) {
//       statusColor = Colors.green;
//     } else if (statusHtml.contains("color:RED")) {
//       statusColor = Colors.red;
//     }
//
//     return Text(
//       statusText,
//       style: TextStyle(color: statusColor),
//     );
//   }
//
//   Widget _buildDateTimeText(String dateTimeString) {
//     DateTime dateTime = DateTime.parse(dateTimeString);
//     String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
//     String formattedTime = DateFormat('hh:mm a').format(dateTime); // Use hh:mm a for AM/PM format
//
//     return Row(
//       children: [
//         Text('Date: $formattedDate'),
//         Text('Time: $formattedTime'),
//       ],
//     );
//   }
//
//
// }
//
//
//
//
//
//
//
//
//
//
// //this is push API testin with username and password
// //       body: Column(
// //         children: [
// //           TextField(controller:userName1 ,decoration: InputDecoration(hintText: "username"),),
// //           TextField(controller:password1 ,decoration: InputDecoration(hintText: "username"),),
// //           ElevatedButton(onPressed: (){
// //             loginUser();
// //           }, child: Text("login"))
// //
// //     ],
// //       ),
// //     );
// //   }
// //
// //   Future<void> loginUser() async {
// //     if (userName1.text.isNotEmpty && password1.text.isNotEmpty) {
// //       var url = Uri.parse("http://api.payonclick.in/Vr1.0/74536/DJKIJF09320923JSDFOJDFLMSDS/KVLKMS09232309283KJSDJLWLEEJ203/api/UserLogin");
// //
// //       String basicAuth = 'webtech#\$%^solution\$\$&&@@&^&july2k21:basic%%##@&&auth&#&#&#&@@#&pasWtS2021';
// //       String encodedAuth = 'Basic ' + base64Encode(utf8.encode(basicAuth));
// //
// //       var response = await http.post(
// //         url,
// //         headers: {
// //           'Authorization': encodedAuth,
// //           'Content-Type': 'application/json',
// //         },
// //         body: jsonEncode({
// //           "userName": userName1.text,
// //           "password": password1.text,
// //           "tokenKey": "1234",
// //           "deviceInfo": "1234"
// //         }),
// //       );
// //
// //       if (response.statusCode == 200) {
// //         var jsonResponse = jsonDecode(response.body);
// //         if (jsonResponse['statuscode'] == 'TXN') {
// //           Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
// //         } else {
// //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login failed. Please check your credentials.")));
// //         }
// //       } else {
// //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to login with status code: ${response.statusCode}")));
// //       }
// //     } else {
// //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Both username and password are required.")));
// //     }
// //   }
// // }