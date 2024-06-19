import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

class RechargeTransactionSlip extends StatefulWidget {
  final String txnID;
  final num amount;
  final String liveID;
  final String number;
  final  num openingBalance;

  final double closingBalance;
  final String operatorName;
  final String  status;
  final String txnDate;
  final String ownerName;
  final String userType;

  const RechargeTransactionSlip({
    super.key,
    required this.txnID,
    required this.amount, required this.liveID, required this.number, required this.openingBalance, required this.closingBalance, required this.operatorName, required this.status, required this.txnDate, required this.ownerName, required this.userType,

  });

  @override
  State<RechargeTransactionSlip> createState() => _RechargeTransactionSlipState();
}

class _RechargeTransactionSlipState extends State<RechargeTransactionSlip> {
  ScreenshotController screenshotController = ScreenshotController();


  // void _shareContent(String txnID) {
  //   final transactionLink = "https://www.example.com/transaction/$txnID";
  //   Share.share(transactionLink);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "image/ProfileWI.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Scaffold(
            backgroundColor: Colors.transparent, // Ensure the scaffold background is transparent
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
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 25,
                          ), // Change to back arrow icon
                        ),
                      ],
                    ),
                    onPressed: () {
                         Navigator.pop(context); // Navigate back to the previous screen
                    },
                  );
                },
              ),

            ),
            body:Screenshot(
              controller: screenshotController,
              child: Column(
                children: [
                  Container(
                    height: 500,
                    width: 450,
                    margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
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
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text("TRANSACTION SLIP",style: TextStyle(color: Colors.blueAccent,fontSize: 20,fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          height: 50,
                            width: 150,
                            color: Colors.white,
                            child: Image.asset("image/loginicon.png",)),
                        Container(
                          height: 20,
                          color: Colors.white,
                          child: Text("Transactions Details",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 16),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15,right: 15),
                          child: Divider(color: Colors.blueAccent,thickness: 4,),
                        ),
                        Container(
                          height: 2,
                          margin: EdgeInsets.only(left: 30,right: 30),
                          color: Colors.brown,
                        ),
                        Container(
                          height: 25, width: double.infinity,
                          margin: EdgeInsets.only(left: 15,right: 15),
                          color: Colors.white,
                          child: Row(
                            children: [
                              Text("TxId",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,),),
                              Spacer(),
                              Text("${widget.txnID}",style: TextStyle(fontSize: 12),)
                            ],
                          ),
                        ),
                        Container(
                          height: 25, width: double.infinity,
                          margin: EdgeInsets.only(left: 15,right: 15),
                          color: Colors.white,
                          child: Row(
                            children: [
                              Text("Live ID",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,),),
                              Spacer(),
                              Text("${widget.liveID}",style: TextStyle(fontSize: 12),)
                            ],
                          ),
                        ),
                        Container(
                          height: 25, width: double.infinity,
                          margin: EdgeInsets.only(left: 15,right: 15),
                          color: Colors.white,
                          child: Row(
                            children: [
                              Text("Number",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,),),
                              Spacer(),
                              Text("${widget.number}",style: TextStyle(fontSize: 12),)
                            ],
                          ),
                        ),
                        Container(
                          height: 25, width: double.infinity,
                          margin: EdgeInsets.only(left: 15,right: 15),
                          color: Colors.white,
                          child: Row(
                            children: [
                              Text("Opening Balance",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,),),
                              Spacer(),
                              Text("\u{20B9}${widget.openingBalance}",style: TextStyle(fontSize: 12),)
                            ],
                          ),
                        ),
                        Container(
                          height: 25, width: double.infinity,
                          margin: EdgeInsets.only(left: 15,right: 15),
                          color: Colors.white,
                          child: Row(
                            children: [
                              Text("Amount",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,),),
                              Spacer(),
                              Text("\u{20B9}${widget.amount}",style: TextStyle(fontSize: 12),)
                            ],
                          ),
                        ),
                        Container(
                          height: 25, width: double.infinity,
                          margin: EdgeInsets.only(left: 15,right: 15),
                          color: Colors.white,
                          child: Row(
                            children: [
                              Text("Closing Bal",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,),),
                              Spacer(),
                              Text("\u{20B9}${widget.closingBalance}",style: TextStyle(fontSize: 12),)
                            ],
                          ),
                        ),
                        Container(
                          height: 25, width: double.infinity,
                          margin: EdgeInsets.only(left: 15,right: 15),
                          color: Colors.white,
                          child: Row(
                            children: [
                              Text("Operator",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,),),
                              Spacer(),
                              Text("${widget.operatorName}",style: TextStyle(fontSize: 12),)
                            ],
                          ),
                        ),
                        Container(
                          height: 25, width: double.infinity,
                          margin: EdgeInsets.only(left: 15,right: 15),
                          color: Colors.white,
                          child:_buildStatusText("${widget.status}"), // Use a helper method to style the status text

                          // Row(
                          //   children: [
                          //     Text("Status",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,),),
                          //     Spacer(),
                          //     Text(
                          //       "${widget.status}",
                          //       style: TextStyle(fontSize: 12,color: Color.fromRGBO( 2,172,10,1),fontWeight: FontWeight.bold),)
                          //   ],
                          // ),
                        ),
                        Container(
                          height: 40,
                          width: double.infinity,
                          margin: EdgeInsets.only(left: 15,right: 15),
                          color: Colors.transparent,
                          child: _buildDateTimeText(widget.txnDate), // Use a hel

                          // Row(
                          //   children: [
                          //     Text("Date",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,),),
                          //     Spacer(),
                          //     Text("${widget.txnDate}",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)
                          //   ],
                          // ),

                        ),
                        // Container(
                        //   height: 25, width: double.infinity,
                        //   margin: EdgeInsets.only(left: 15,right: 15),
                        //   color: Colors.white,
                        //   child: Row(
                        //     children: [
                        //       Text("Time",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,),),
                        //       Spacer(),
                        //       Text("",style: TextStyle(fontSize: 12),)
                        //     ],
                        //   ),
                        // ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          height: 20,
                          width: double.maxFinite,
                          color: Colors.transparent,
                          child:Text("--------------------------------------------------------------------------------------",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                        ),
                        //_____________congractulation__________
                        Container(
                          height: 56,
                           margin: EdgeInsets.only(top: 20),
                          color: Colors.white,
                          child: Column(
                            children: [
                              Text("Congratulations",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Color.fromRGBO( 2,172,10,1)),),
                              Text("Your Transaction hass Successful",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Color.fromRGBO( 2,172,10,1)))
                            ],
                          ),
                        ),

                      ],
                    ),


                  ),
                  //________out of the Big Box___________
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 20,
                    width: double.infinity,
                    color: Colors.transparent,
                    child: Center(child: Text("Shop Details ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                  ),
                  Container(
                    height: 20,
                    width: double.infinity,
                    color: Colors.transparent,

                        child: Row(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            Text("${widget.ownerName}"),
                            SizedBox(width: 5,),
                            Text("('${widget.userType}')")
                          ],
                        )
                  ),
                  Container(
                      height: 20,
                      width: double.infinity,
                      color: Colors.transparent,

                      child:Center(child: Text("${widget.number}"))

                  ),
                  Container(
                      height: 70,
                      width: double.infinity,
                    color: Colors.transparent,
                    child: Row(
                      children: [
                         Container(
                           height:40,
                           width: 160,
                           margin: EdgeInsets.only(left: 15),
                           child: ElevatedButton(
                            onPressed: () {
                          //    Navigator.pop(context);
                            },
                            child: Text('Raise Complain',style: TextStyle(fontSize: 14),),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.red,
                            ),),
                         ),
                       Spacer(),

                        Container(
                          height:40,
                          width: 160,
                          margin: EdgeInsets.only(right: 15),
                          child: ElevatedButton(
                            onPressed: () async{
                            //  Navigator.pop(context);
                              final image = await screenshotController.capture();
                              if (image == null) return;

                              // Save the image to a file
                              final directory = await getApplicationDocumentsDirectory();
                              final imagePath = '${directory.path}/screenshot.png';
                              final imageFile = File(imagePath);
                              await imageFile.writeAsBytes(image);

                              // Share the image file
                              Share.shareFiles([imagePath], text: 'Check out my page!');
                            },
                            child: Text('Share',style: TextStyle(fontSize: 14),),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildDateTimeText(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    String formattedTime = DateFormat('hh:mm a').format(dateTime); // Use hh:mm a for AM/PM format

    return Container(

      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("Date: ",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,)),
              Spacer(),
              Text("$formattedDate",style: TextStyle(fontSize: 12),)
            ],
          ),

          Row(
            children: [
              Text('Time:',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,)),
              Spacer(),
              Text('$formattedTime',style: TextStyle(fontSize: 12),)
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusText(String statusHtml) {
    // Parse the HTML content to extract text and color
    var document = parse(statusHtml);
    var statusText = document.body!.text;
    var statusColor = Colors.green;

    // Determine color based on the status text
    if (statusHtml.contains("color:green")) {
      statusColor = Colors.green;
    } else if (statusHtml.contains("color:RED")) {
      statusColor = Colors.red;
    }

    return Row(
      children: [
        Text("Status ",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,),),
        Spacer(),
        Text(
          statusText,
          style: TextStyle(color: statusColor,fontWeight: FontWeight.bold),
        ),
      ],
    );
  }


}
