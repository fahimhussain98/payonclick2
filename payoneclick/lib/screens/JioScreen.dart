


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payoneclick/Api_Services/Api_Service.dart';
import 'package:payoneclick/Api_Services/Api_models/MainWBModel.dart';
import 'package:payoneclick/Api_Services/Api_models/RechargeModel/DropDrownButtonModel.dart';
import 'package:payoneclick/TabBar/MobileRecharge_myPlan/MobileRechageMyPlanTabBar.dart';
import 'package:payoneclick/TabBar/MobilleRecharge_Browseplan/tabBar.dart';

class JioScreen extends StatefulWidget {
  final String userID;
  final String rechargeType; //// this is show the TEXt in the jio Screen
  final bool showStateTextField;
  final String serviceID; // this is pass the dynamically
  final bool fromMobileRecharge;

  // final String? WalletBalance;
  //final LoginModel? loginModelData; //isse sara data aa rhe hai login API se
  const JioScreen({
    Key? key,
    required this.showStateTextField,
    required this.userID,
    required this.rechargeType,
    required this.serviceID,
    required this.fromMobileRecharge, // this is pass the dynamically to the APIServies
   // required this.loginModelData,
  }) : super(key: key);


  @override
  State<JioScreen> createState() => _JioScreenState();
}

class _JioScreenState extends State<JioScreen> {
  TextEditingController subscribeIDcontroller = TextEditingController(); //mobileNumberController hai
  var showStateTextField = false;
  var dropdownValue;
  MainWBModel? MWBmodel;
  bool isLoading = true;
  String? selectedOperatorImage;//this is for the Select Operator image ko JioIcon tk jekr jana hai

  ApiServices apiServices = ApiServices();

  @override
  void initState() {
    super.initState();
    fetch_MainWB(widget.userID);
    fetchOperatorNames(widget.userID,widget.serviceID);//widget.userID

  }

  String? selectedState;//

  final List<String> _states = [
    "Assam",
    "Bihar Jharkhand",
    "Chennai",
    "Delhi NCR",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu Kashmir",
    "Karnataka",
    "Kerala",
    "Kolkata",
    "Madhya Pradesh Chhattisgarh",
    "Maharashtra Goa",
    "Mumbai",
    "North East",
    "Orissa",
    "Punjab",
    "Rajasthan",
    "Tamil Nadu",
    "UP East",
    "UP West",
    "West Bengal"
  ];
  //++++++++++++++++++++++++++++++++++++++++++
  String? dropdownValue2; //this is hold the value of the getOperator
  List<Data_DrownButtonModel> operatorData =[];
  List<Data_DrownButtonModel> dataList = [];


  Future<void> fetch_MainWB(String userID) async {//String userID
    MWBmodel = await apiServices.fetchMainWB(userID);//userID
    setState(() {
      isLoading = false;
    });
  }

  //this methode for the Operator on the jioScreen
  @override
  Future<void> fetchOperatorNames(String userID,String serviceID) async {//String userID
    ApiServices apiServices = ApiServices();
    DropDrownButtonModel? dropdownButtonModel = await apiServices.getOperatorsList(userID,serviceID);//userID
    if (dropdownButtonModel != null && dropdownButtonModel.data != null) {
      dataList = dropdownButtonModel.data!;
    }
    setState(() {
      operatorData = dataList;

    });
  }



  @override
  Widget build(BuildContext context) {
    print(selectedState);
    print(dropdownValue2);
    print(subscribeIDcontroller);


    return  Scaffold(
     // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Align(
          alignment: Alignment.topRight,
          child: Image.asset("image/icon2.png",
            width: 150,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // This will pop the current screen off the navigation stack
          },
        ),


      ),



      body: Stack(
        children: [
          Image.asset(
            "image/airtelBack.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(

            child:
            Container(
              margin: EdgeInsets.only(left: 25, right: 25, top: 95),
              width: 360,
              height: 550,
              decoration: BoxDecoration(
                color: Colors.grey[50],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5), // Shadow color
                    spreadRadius: 1, // Spread radius
                    blurRadius: 5, // Blur radius
                    offset: Offset(0, 5), // Offset in x and y directions
                  ),
                ],
                borderRadius: BorderRadius.circular(10), // Optional: for rounded corners
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20.0), // Optional: add padding inside the container
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start, // Centers the column's content vertically
                    children: <Widget>[

                      // TextField(
                      //   decoration: InputDecoration(
                      //     //  labelText: 'Subscribe ID 2',
                      //     //   hintText: '',
                      //     border: OutlineInputBorder(
                      //       borderSide: BorderSide(color: Colors.grey), // Set the border color to grey
                      //     ),
                      //     enabledBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(color: Colors.grey), // Set the border color to grey when not focused
                      //     ),
                      //     focusedBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(color: Colors.grey), // Set the border color to grey when focused
                      //     ),
                      //
                      //   ),
                      // ),

                      Padding(
                        padding: const EdgeInsets.only(top: 40,left: 15,right: 15),
                        child: Text(
                          widget.rechargeType, // Use the passed parameter to set the text
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF046DB5),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Subscribe ID",style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.black,)),
                          SizedBox(height: 10,),
                          SizedBox(
                            height: 50, // Specify the desired height here
                            child: TextField(
                              controller: subscribeIDcontroller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey,width: 1), // Set the default border color to gray
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey), // Set the border color when the field is not focused
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey), // Set the border color when the field is focused
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 5,),
                          //this is Droupdown
                          Text("Seclet Operator"),
                          SizedBox(height: 5,),

                          Container(
                            height: 50,

                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                            ),
                            child: DropdownButton<String>(
                              value: dropdownValue2,
                              isExpanded: true,
                              underline: SizedBox(),
                              hint: Text('Select the operator',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15,color: Colors.grey),),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue2 = newValue!;
                                  selectedOperatorImage = operatorData
                                      .firstWhere((operator) => operator.operatorName == newValue)
                                      .oPImage;
                                });
                              },
                              items: operatorData.map<DropdownMenuItem<String>>((Data_DrownButtonModel data) {
                                return DropdownMenuItem<String>(

                                  value: data.operatorName,
                                  child: Row(
                                    children: [
                                      if (data.oPImage != null)
                                        Container(

                                          // color: Colors.amber,
                                          child: Image.network(
                                            'http://login.payonclick.in${data.oPImage}',
                                            height: 30,width: 30,
                                          ),
                                        ),
                                      SizedBox(width: 10),
                                      Text(
                                        data.operatorName ?? '',style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                              dropdownColor: Colors.grey[50],
                            ),
                          ),


                          SizedBox(height: 10,),



                          if (widget.showStateTextField)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "State",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey, width: 1),
                                  ),
                                  child: DropdownButtonFormField<String>(
                                    value: selectedState,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(vertical: 13.0, horizontal: 10.0),
                                      border: InputBorder.none,
                                    ),
                                    items: _states.map((String state) {
                                      return DropdownMenuItem<String>(
                                        value: state,
                                        child: Text(state),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedState = newValue;
                                      });
                                    },
                                    hint: Text("Select a State",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15,color: Colors.grey),),
                                  ),
                                ),
                                SizedBox(height: 5),

                              ],
                            ),
                          SizedBox(height: 5,),

                          Text("Amount ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.black,)),
                          SizedBox(height: 5,),
                          SizedBox(
                            height: 50, // Specify the desired height here
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey), // Set the default border color to gray
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey), // Set the border color when the field is not focused
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey), // Set the border color when the field is focused
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 5,),
                          //icon + text
                          Container(
                              height: 30,
                              //  color: Colors.purple.shade50,
                              child: Row(
                                children: [
                                  Stack(
                                      children:[
                                        Image.asset("image/ACE.png"),

                                        Center(

                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 7,top: 4,bottom: 8,),
                                            child: Icon(Icons.search,size: 18,color: Colors.white,),
                                          ),
                                        ),

                                      ]),
                                  if(widget.fromMobileRecharge) ...[
                                    InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>
                                              MobileRechargeTabBar(
                                                title: "Your Plan",
                                                userID: widget.userID,
                                                selectedState: selectedState,
                                                dropdownValue2: dropdownValue2,
                                                  serviceID: "1"

                                                //   userID: userID,
                                                // dropdownValue: dropdownValue2, //this is hold the value Operator
                                                // selectedState: selectedState, //this is hold the circle

                                              ) ));
                                    },
                                      child: Text("Browse Plan",style: TextStyle(fontSize: 13,))
                                  ),
                                  ]else ...[
                                    Text("Browse Plan",style: TextStyle(fontSize: 13,)),
                                  ],
                                  Spacer(),

                                  if(widget.fromMobileRecharge) ...[
                                    InkWell(
                                    onTap: (){
                                      int mobileNumber = int.tryParse(subscribeIDcontroller.text) ?? 0;
                                      Navigator.push(

                                      context,
                                          MaterialPageRoute(builder: (context) =>
                                              MobileChargeMyPlanTabBar(
                                                title: 'My Plan',
                                                userID: widget.userID,
                                               // mobileNumber: subscribeIDcontroller,
                                                mobileNumber: mobileNumber,
                                                dropdownValue2: dropdownValue2, //hold the operator name  mobile //state is not IN there API
                                                  serviceID: "1"
                                                //   userID: userID,
                                                // dropdownValue: dropdownValue2, //this is hold the value Operator
                                                // selectedState: selectedState, //this is hold the circle

                                              )
                                          ));
                                    },
                                    child: Text(
                                      "My plains ",style: TextStyle(fontSize: 13,color: Colors.indigo),),
                                  ),
                                  ] else ...[
                                    Text(
                                      "My plains ",style: TextStyle(fontSize: 13,color: Colors.indigo),),
                                  ],

                                  Image.asset("image/ACE.png"),

                                ],
                              )
                          ),
                          SizedBox(height: 5,),
                          //button
                          Container(
                            height: 45,
                            width: 400,
                            margin: EdgeInsets.only(top: 15 ),
                            child: ElevatedButton(
                              onPressed: () {
                                // Navigator.pop(context);
                              },
                              child: Text('PROCEED TO PAY',style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                foregroundColor: Colors.white,
                                backgroundColor: Color(0xFF0361A2),

                              ),
                            ),
                          )


                        ],
                      ),




                    ],

                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              // color: Colors.amber,
              width: 230,
              height: 80,
              margin: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),


              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,

                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only( left: 5,top: 10),
                        child: Text("Wallet Balance  ",style: TextStyle(fontSize: 15,)),
                      ),
                      // Text("\u20B9 ${MWBmodel?.data?.userBalance ?? '0.00'}"),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text('\u20B9'
                        // '${widget.WalletBalance}',
                        // "${widget.loginModelData!.data!.walletBalance}",// this is not checking of the null value
                        //   '${widget.loginModelData!.data?.walletBalance ?? '0.00'}', //// ye data  login-> bottomNavBar -> home -> jioScreen
                            '${MWBmodel?.data?.userBalance ?? '0.00'}', // ye data alag API se se

                            style: TextStyle(fontSize: 20, color: Colors.black)),
                      ),




                    ],
                  ),
                  Image.asset("image/walletIconIn.png",height: 80,width: 80,),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 90),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber,
              ),
             // color: Colors.amber,
              child: CircleAvatar(
                backgroundColor: Colors.grey[50],
                child: selectedOperatorImage != null
                    ? Image.network(
                  'http://login.payonclick.in$selectedOperatorImage',
                  fit: BoxFit.cover,
                )
                    : Image.asset("image/walletIconIn.png"),
                radius: 50,
              ),

            ),
          ),







        ],


      ),



      // body: Stack(
      //   children: [
      //     Image.asset("image/airtelBack.png",
      //       width: double.infinity,
      //       height: double.infinity,
      //       fit: BoxFit.cover,
      //     ),
      //     Center(
      //
      //         child:
      //         Container(
      //           margin: EdgeInsets.only(left: 25, right: 25, top: 100),
      //           width: 368,
      //           height: 550,
      //           decoration: BoxDecoration(
      //             color: Colors.grey[50],
      //             boxShadow: [
      //               BoxShadow(
      //                 color: Colors.black.withOpacity(0.5), // Shadow color
      //                 spreadRadius: 1, // Spread radius
      //                 blurRadius: 5, // Blur radius
      //                 offset: Offset(0, 5), // Offset in x and y directions
      //               ),
      //             ],
      //             borderRadius: BorderRadius.circular(10), // Optional: for rounded corners
      //           ),
      //           child: Padding(
      //             padding: EdgeInsets.all(20.0), // Optional: add padding inside the container
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.start, // Centers the column's content vertically
      //               children: <Widget>[
      //
      //                 // TextField(
      //                 //   decoration: InputDecoration(
      //                 //     //  labelText: 'Subscribe ID 2',
      //                 //     //   hintText: '',
      //                 //     border: OutlineInputBorder(
      //                 //       borderSide: BorderSide(color: Colors.grey), // Set the border color to grey
      //                 //     ),
      //                 //     enabledBorder: OutlineInputBorder(
      //                 //       borderSide: BorderSide(color: Colors.grey), // Set the border color to grey when not focused
      //                 //     ),
      //                 //     focusedBorder: OutlineInputBorder(
      //                 //       borderSide: BorderSide(color: Colors.grey), // Set the border color to grey when focused
      //                 //     ),
      //                 //
      //                 //   ),
      //                 // ),
      //                 Padding(
      //                   padding: const EdgeInsets.only(top: 50,left: 15,right: 15),
      //                   child: Text("DTH RECHARGE",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xFF046DB5),
      //                   )),
      //                 ),
      //                 SizedBox(height: 10),
      //                 Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: <Widget>[
      //                     Text("Subscribe ID",style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.black,)),
      //                     SizedBox(height: 10,),
      //                     SizedBox(
      //                       height: 55, // Specify the desired height here
      //                       child: TextField(
      //                         decoration: InputDecoration(
      //                           border: OutlineInputBorder(),
      //                         ),
      //                       ),
      //                     ),
      //                     SizedBox(height: 10,),
      //                     //this is Droupdown
      //                     Text("Seclet Operator"),
      //                     SizedBox(height: 10,),
      //                     Container(
      //                       //  padding: EdgeInsets.only(left: 5,right: 5),
      //                       decoration:BoxDecoration(
      //                           border: Border.all(color: Colors.grey,width: 1)
      //                       ),
      //                       child: DropdownButton<String>(
      //                         value: dropdownValue,
      //                         isExpanded: true,
      //                         underline: SizedBox(),
      //                         onChanged: (String? newValue) {
      //                           setState(() {
      //                             dropdownValue = newValue!;
      //                           });
      //                         },
      //                         items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
      //                             .map<DropdownMenuItem<String>>((String value) {
      //                           return DropdownMenuItem<String>(
      //                             value: value,
      //                             child: Text(value),
      //                           );
      //                         }).toList(),
      //                         // underline: Container(
      //                         //   height: 1,
      //                         //   color: Colors.grey, // Set the underline color to grey
      //                         // ),
      //                         dropdownColor: Colors.grey[50], // Optional: Set the dropdown background color to match the container background color
      //
      //                       ),
      //                     ),
      //                     SizedBox(height: 10,),
      //
      //                     SizedBox(height: 10,),
      //                     Text("Amount "),
      //                     SizedBox(height: 10,),
      //                     SizedBox(
      //                       height: 55, // Specify the desired height here
      //                       child: TextField(
      //                         decoration: InputDecoration(
      //                           border: OutlineInputBorder(),
      //                         ),
      //                       ),
      //                     ),
      //
      //                     SizedBox(height: 10,),
      //
      //                   ],
      //                 ),
      //
      //
      //                 SizedBox(height: 10,),
      //                 //icon + text
      //                 Container(
      //                   height: 30,
      //                  // color: Colors.purple.shade50,
      //                   child: Row(
      //                     children: [
      //                       Stack(
      //                           children:[
      //                         Image.asset("image/ACE.png"),
      //                         Center(
      //
      //                           child: Padding(
      //                             padding: const EdgeInsets.only(left: 8,top: 4,bottom: 8,),
      //                             child: Icon(Icons.search,size: 18,),
      //                           ),
      //                         ),
      //
      //                       ]),
      //                       Spacer(),
      //                       Text("My plains ",style: TextStyle(fontSize: 13,color: Colors.indigo),),
      //                       Image.asset("image/ACE.png"),
      //
      //                     ],
      //                   )
      //                 ),
      //                 SizedBox(height: 10,),
      //                 //button
      //                 Container(
      //                   height: 45,
      //                   width: 400,
      //                   //margin: EdgeInsets.only(left: 5,right: 5, ),
      //                   child: ElevatedButton(
      //                     onPressed: () {
      //                      // Navigator.pop(context);
      //                     },
      //                     child: Text('PROCEED TO PAY',style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),),
      //                     style: ElevatedButton.styleFrom(
      //                       shape: RoundedRectangleBorder(
      //                         borderRadius: BorderRadius.circular(12.0),
      //                       ),
      //                       foregroundColor: Colors.white,
      //                       backgroundColor: Color(0xFF0361A2),
      //
      //                     ),
      //                   ),
      //                 )
      //
      //               ],
      //
      //             ),
      //           ),
      //         )
      //
      //       // CircleAvatar(
      //       //   child: Image.asset("assets/Airtel.png"),
      //       //   radius: 20,
      //       // )
      //       //
      //
      //
      //     ),
      //     Align(
      //       alignment: Alignment.topCenter,
      //       child: Container(
      //         margin: EdgeInsets.only(top: 150),
      //         child: CircleAvatar(
      //           backgroundColor: Colors.grey[50],
      //           child: Image.asset("image/Airtel.png",),
      //           radius: 50,
      //         ),
      //
      //       ),
      //     ),
      //     // Column(
      //     //   children: [
      //     //     TextField(
      //     //       decoration: InputDecoration(
      //     //         labelText: 'Subscribe ID', // Label that appears above the text field when focused
      //     //         hintText: 'Enter your subscribe ID', // Hint text that appears inside the text field when empty
      //     //         border: OutlineInputBorder(), // Optional: Adds a border around the text field
      //     //       ),
      //     //
      //     //     )
      //     //   ],
      //     // )
      //     Align(
      //       alignment: Alignment.topCenter,
      //       child: Container(
      //         margin: EdgeInsets.only(top: 40,),
      //
      //         height: 110,
      //         width: 120,
      //      //   color: Colors.indigoAccent,
      //         child: Column(
      //           children: [
      //             Padding(
      //               padding: const EdgeInsets.only(top: 25),
      //               child: Text("Wallet Balance",style: TextStyle(fontSize: 14,),),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.only(left:0,top: 5),
      //               child: Text('\u20B9'"200", style: TextStyle(fontSize: 26, color: Colors.black)),
      //             ),
      //
      //
      //           ],
      //         ),
      //       ),
      //     )
      //
      //
      //
      //   ],
      //
      //
      // ),

    );
  }
}
