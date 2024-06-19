import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:payoneclick/Api_Services/Api_Service.dart';
import 'package:payoneclick/Api_Services/Api_models/RechargeModel/RechargeReportModel.dart';
import 'package:payoneclick/Slips/RechargeTransactionSlip.dart';

class RechargeReportScreen extends StatefulWidget {
final String userID;

  const RechargeReportScreen({Key? key, required this.userID, }) : super(key: key);

  @override
  _RechargeReportScreenState createState() => _RechargeReportScreenState();
}

class _RechargeReportScreenState extends State<RechargeReportScreen> {

  //_________RechargeReportAPI containe data into list array _____________________
  List<String> txnIDs = []; // List to store TxnIDs
  List<String> number=[];
  List<double> payableAmount= [];
  List<num> amount = [];
  List<num> openingBalance = [];
  List<num> commission = [];
  List<String> txnDate = [];
  List<String> operatorName = [];
  List<String>oPImage = [];
  List<String>sTATUS = [];
  List<String> liveID=[];
  List<double> closingBalance =[];
  List<String> ownerName =[];
  List<String> userType = [];

  @override
  void initState() {
    super.initState();
    // Call the function to fetch data when the widget is initialized
    fetchData(userID: widget.userID);
  }
  Future<void> fetchData({DateTime? fromDate, DateTime? toDate,required String userID}) async {
    // Replace these values with your actual userID and serviceID
  //  String userID = 'AhCtz8JqpO4FdfEQaakgb1unsKFHQMXB';
    String serviceID = '1';

    // Call your API service method to get recharge report
    var apiService = ApiServices();
    var result = await apiService.getRechargeReport(userID, serviceID);

    // If result is not null and contains data
    if (result != null && result.data != null) {
      setState(() {
        // Clear previous data
        txnIDs.clear();
        number.clear();
        payableAmount.clear();
        amount.clear();
        openingBalance.clear();
        commission.clear();
        txnDate.clear();
        operatorName.clear();
        oPImage.clear();
        sTATUS.clear();
        liveID.clear();
        closingBalance.clear();

        // Extracting all data with optional date filtering
        result.data!.forEach((report) {
          DateTime txnDateTime = DateTime.parse(report.txnDate!);
          if ((fromDate == null || txnDateTime.isAfter(fromDate.subtract(Duration(days: 1)))) &&
              (toDate == null || txnDateTime.isBefore(toDate.add(Duration(days: 1))))) {
            txnIDs.add(report.txnID!);
            number.add(report.number!);
            payableAmount.add(report.payableAmount!);
            amount.add(report.amount!);
            openingBalance.add(report.openingBalance!);
            commission.add(report.commission!);
            txnDate.add(report.txnDate!);
            operatorName.add(report.operatorName!);
            oPImage.add(report.oPImage!);
            sTATUS.add(report.sTATUS!);
            liveID.add(report.liveID!);
            closingBalance.add(report.closingBalance!);
            ownerName.add(report.ownerName!);
            userType.add(report.userType!);

          }
        });
      });
    }
    // Debugging information
    print('txnIDs length: ${txnIDs.length}');
    print('number length: ${number.length}');
    print('payableAmount length: ${payableAmount.length}');
    print('payableAmount length: ${amount.length}');
    // print("status : ${sTATUS}");
    print("yan hai apki userID of the REcharge ReportScreen:::::${widget.userID}");

  }

  //______________________calendar functoin_________________________

  DateTime _focusedDay = DateTime.now();
  DateTime? _fromDate;
  DateTime? _toDate;
  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    DateTime? tempPickedDate;
    final DateTime? pickedDate = await showDialog<DateTime>(
      context: context,
      builder: (BuildContext context) {
        print("from Date yan hai ${_fromDate}");
        print("T000 Date yan hai ${_toDate}");
        return Center(
          child: Container(
            width: 300,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // Changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Material(
                      child: Theme(
                        data: ThemeData(
                          colorScheme: ColorScheme.dark(
                            primary: Colors.deepPurple, // Header background color
                            background: Colors.white,
                            onPrimary: Colors.grey, // Header text color
                            onSurface: Colors.black, // Calendar text color
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.blue, // Button text color
                            ),
                          ),
                        ),
                        child: CalendarDatePicker(
                          initialDate: _focusedDay,
                          firstDate: DateTime(2010),
                          lastDate: DateTime.now(),
                          onDateChanged: (DateTime date) {
                            tempPickedDate = date;
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(null);
                      },
                      child: Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(tempPickedDate);
                      },
                      child: Text("OK"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
    if (pickedDate != null) {
      setState(() {
        if (isFromDate) {
          _fromDate = pickedDate;
        } else {
          _toDate = pickedDate;
        }
        _focusedDay = pickedDate;
      });
    }
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
  //______________change the color if sTATUS Failed_________________________
  String parseStatus(String htmlStatus) {
    final RegExp regex = RegExp(r"color:(.*?)>(.*?)<\/span>");
    final match = regex.firstMatch(htmlStatus);
    if (match != null) {
      return match.group(2)!.trim();
    }
    return htmlStatus;
  }

  Color getStatusColor(String status) {
    final parsedStatus = parseStatus(status);
    // print("Parsed Status for color: $parsedStatus");
    return parsedStatus == "FAILED" ? Colors.red : Color.fromRGBO(2, 172, 10, 1);
  }
  //______________________getRechargeReport_________________________
  RechargeReportsModel rechargeReportsModel = RechargeReportsModel();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Scaffold(
        body: Stack(
          children: [
            Image.asset(
              "image/ProfileWI.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0, // Remove shadow
                leading: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: Stack(
                        children: [
                          Image.asset('image/circleForDrawer.png'),
                          Padding(
                            padding: const EdgeInsets.only(left: 7, top: 5),
                            child: InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 25,
                              ),
                            ), // Change to back arrow icon
                          ),
                        ],
                      ),
                      onPressed: () {
                        //   Navigator.pop(context); // Navigate back to the previous screen
                      },
                    );
                  },
                ),
                title: Center(
                  child: Text(
                    "RECHARGE REPORT",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              body: Column(
                children: [
                  //here is the two Row for the Calendar
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => _selectDate(context, true),
                        child: Container(
                          height: 70,
                          width: 170,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // Changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.calendar_month_outlined),
                              // Here is the From Date
                              SizedBox(width: 12),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("From Date", style: TextStyle(color: Colors.grey, fontSize: 13)),
                                  Text(
                                    _formatDate(_fromDate) == '' ? "2024-05-01" : _formatDate(_fromDate),
                                    style: TextStyle(color: Colors.indigoAccent, fontSize: 13, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () => _selectDate(context, false),
                        child: Container(
                          height: 70,
                          width: 170,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // Changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.calendar_month_outlined),
                              // Here is the To Date
                              SizedBox(width: 12),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("To Date", style: TextStyle(color: Colors.grey, fontSize: 13)),
                                  Text(
                                    _formatDate(_toDate) == '' ? "2024-06-06" : _formatDate(_toDate),
                                    style: TextStyle(color: Colors.indigoAccent, fontSize: 13, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),

                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5,right: 5),
                        height: 40,
                        width: 160,
                        child: ElevatedButton(
                          onPressed: () {
                            //  Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              Icon(Icons.filter_alt_outlined),
                              Text('FILTER',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9.0),
                            ),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.indigoAccent,

                          ),
                        ),
                      ),
                      Spacer(),

                      Container(
                        margin: EdgeInsets.only(right: 5),
                        height: 40,
                        width: 160,
                        child: ElevatedButton(
                          onPressed: () {
                            fetchData(fromDate: _fromDate, toDate: _toDate,userID: widget.userID);                        },
                          child: Text('SUBMIT',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9.0),
                            ),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.indigoAccent,

                          ),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 20,),
                  Expanded(
                    child: txnIDs.isNotEmpty && number.isNotEmpty && payableAmount.isNotEmpty
                        ? ListView.builder(
                      itemCount: txnIDs.length,
                      itemBuilder: (context, index) {
                        // Ensure index is within valid range
                        if (index < txnIDs.length && index < number.length && index < payableAmount.length) {
                          return Card(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 5, right: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 1), // Changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 190,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          // color: Color.fromRGBO(2, 172, 10, 1),
                                          color: getStatusColor(sTATUS[index]),
                                          borderRadius: BorderRadius.circular(9),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 40, right: 10),
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Text(
                                                  "\u{20B9} ${amount[index]}",
                                                  style: TextStyle(
                                                      fontSize: 21,
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                margin: EdgeInsets.only(top: 15, left: 5),
                                                height: 25,
                                                color: Colors.transparent,
                                                child: Row(
                                                  children: [
                                                    Text("OpeningBalance:", style: TextStyle(color: Colors.white)),
                                                    Spacer(),
                                                    Text("\u{20B9} ${openingBalance[index]}",
                                                        style: TextStyle(color: Colors.white))
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                margin: EdgeInsets.only(left: 5),
                                                height: 25,
                                                color: Colors.transparent,
                                                child: Row(
                                                  children: [
                                                    Text("Closing Bal. ", style: TextStyle(color: Colors.white)),
                                                    Spacer(),
                                                    Text("\u{20B9} ${closingBalance[index]}",
                                                        style: TextStyle(color: Colors.white))
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                margin: EdgeInsets.only(left: 5),
                                                height: 25,
                                                color: Colors.transparent,
                                                child: Row(
                                                  children: [
                                                    Text("Cash Back ", style: TextStyle(color: Colors.white)),
                                                    Spacer(),
                                                    Text("\u{20B9}${commission[index]}",
                                                        style: TextStyle(color: Colors.white))
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                margin: EdgeInsets.only(left: 5),
                                                height: 25,
                                                color: getStatusColor(sTATUS[index]),
                                                child: Row(
                                                  children: [

                                                    _buildStatusText(sTATUS[index]),
                                                    Spacer(),
                                                    IconButton(
                                                      icon: Icon(
                                                        Icons.share,
                                                        size: 25,
                                                        color: Colors.white,
                                                      ),
                                                      // onPressed: () => _shareContent(txnIDs[index]),
                                                      onPressed: (){
                                                        Navigator.push(context, MaterialPageRoute(builder: (context) => RechargeTransactionSlip(
                                                          txnID: txnIDs[index], // Pass the specific data you want
                                                          amount: amount[index],
                                                          liveID: liveID[index],
                                                          number:number[index],
                                                          openingBalance: openingBalance[index],
                                                          closingBalance: closingBalance[index],
                                                          operatorName: operatorName[index],
                                                          status: sTATUS[index],
                                                          txnDate: txnDate[index],
                                                          ownerName: ownerName[index],
                                                          userType: userType[index],


                                                        )
                                                        ));
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 85,
                                        width: 260,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(9),
                                            bottomRight: Radius.circular(20),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 20, left: 10),
                                              child: Image.network(
                                                "http://login.payonclick.in${oPImage[index]}",
                                                height: 25,
                                                width: 25,
                                                errorBuilder: (context, error, stackTrace) {
                                                  return Text('image nai aa rhe hai'); // Handle errors gracefully
                                                },
                                                loadingBuilder: (context, child, loadingProgress) {
                                                  if (loadingProgress == null) {
                                                    return child;
                                                  }
                                                  return Center(
                                                    child: CircularProgressIndicator(
                                                      value: loadingProgress.expectedTotalBytes != null
                                                          ? loadingProgress.cumulativeBytesLoaded /
                                                          loadingProgress.expectedTotalBytes!
                                                          : null,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            SizedBox(width: 15),
                                            Padding(
                                              padding: EdgeInsets.only(top: 35),
                                              child: Text(
                                                "${number[index]}  \n ${operatorName[index]}",
                                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          height: 40,
                                          width: 400,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(9),
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 10),
                                                    child: Text(
                                                      "Txnld : ${txnIDs[index]}",
                                                      style: TextStyle(
                                                          fontSize: 12, fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  _buildDateTimeText(txnDate[index]),
                                                ],
                                              ),
                                              // Text("12:32 am ")
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return SizedBox(); // Return an empty widget if index is out of range
                        }
                      },
                    )
                        : Center(child: Text("Ooo...Opps data not Found", style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20,color: Colors.teal),),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),),
    );



  }

  //______________Status methode______________________

  Widget _buildStatusText(String statusHtml) {
    // Parse the HTML content to extract text and color
    var document = parse(statusHtml);
    var statusText = document.body!.text;
    var statusColor = Colors.white;

    // Determine color based on the status text
    if (statusHtml.contains("color:green")) {
      statusColor = Colors.green;
    } else if (statusHtml.contains("color:RED")) {
      statusColor = Colors.white;
    }

    return Text(
      statusText,
      style: TextStyle(color: statusColor),
    );
  }
  //______________date and Time methode______________________
  Widget _buildDateTimeText(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    String formattedTime = DateFormat('hh:mm a').format(dateTime); // Use hh:mm a for AM/PM format

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 5,top: 5),
          child: Text('Date: $formattedDate',style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5,),
          child: Text('Time: $formattedTime',style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

}
