import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payoneclick/Api_Services/Api_Service.dart';
import 'package:payoneclick/Api_Services/Api_models/TabBarModel/MyplansInMobileRechangeScreenModel.dart';

class MobileChargeMyPlanTabBar extends StatefulWidget {
  final String title;
  final String userID;
  final String? dropdownValue2; // this holds operator name
  final int mobileNumber;
//  final int  mobileNumber; //this is the mobile number field
 // final String serviceID;

  const MobileChargeMyPlanTabBar({
    super.key,
    required this.title,
    required this.userID,
    this.dropdownValue2,
    required this.mobileNumber,
 //   required this.serviceID
  });

  @override
  State<MobileChargeMyPlanTabBar> createState() => _MobileChargeMyPlanTabBarState();
}

class _MobileChargeMyPlanTabBarState extends State<MobileChargeMyPlanTabBar> {
  List<Record> records = [];
  bool isLoading = true;
  String errorMessage = '';


  //-------    -----------------

  @override
  void initState() {
    super.initState();
    fetchMyPlanData();
  }
  Future<void> fetchMyPlanData() async {
    ApiServices apiServices = ApiServices();
    var result = await apiServices.getMyPlain(widget.userID, widget.dropdownValue2 ?? '', widget.mobileNumber);
    if (result != null) {
      setState(() {
        records = result.data.records;
        isLoading = false;
      });
    } else {
      setState(() {
        errorMessage = 'Failed to load data';
        isLoading = false;
      });
    }
  }
  //------------ create the methode for the


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
          ? Center(child: Text(errorMessage))
          : ListView.builder(
        padding: EdgeInsets.all(15),
        itemCount: records.length,
        itemBuilder: (context, index) {
          final record = records[index];
          return Card(
            margin: EdgeInsets.only(bottom: 15),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Validity",
                        style: TextStyle(fontSize: 16),
                      ),
                      Spacer(),
                      Card(
                        elevation: 4,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(record.rs),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text("Description"),
                  Text(
                    record.desc,
                    style: TextStyle(fontSize: 13, color: Colors.deepPurple),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
