import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payoneclick/Api_Services/APIService2.dart';
import 'package:payoneclick/Api_Services/Api_models/TabBarModel/fullTTModel.dart';
import 'package:payoneclick/TabBar/MobilleRecharge_Browseplan/TopUp.dart';

import 'package:flutter/material.dart';
//--------------only two screen is working topUp(remain it) -----------------
//-------fulltt , Roaming.dart,threeG.dart,is not use in this app-----------
class MobileRechargeTabBar extends StatefulWidget {
  final String title;
  final String userID;
  final String? selectedState;
  final String? dropdownValue2; // this holds operator name
  final String serviceID;

  const MobileRechargeTabBar({
    super.key,
    required this.title,
    required this.userID,
    this.selectedState,
    this.dropdownValue2,
    required this.serviceID,
  });

  @override
  State<MobileRechargeTabBar> createState() => _MobileRechargeTabBarState();
}

class _MobileRechargeTabBarState extends State<MobileRechargeTabBar> with SingleTickerProviderStateMixin {
  late TabController _controller;
  List<Map<String, dynamic>> availableTabs = [];
  bool showTopUpPage = false;


  @override
  void initState() {
    super.initState();
    fetchFullTTData();
  }

  Future<void> fetchFullTTData() async {
    APISerives2 apiService = APISerives2();
    //-----------here is the conditon of operatorType-----------
    if (widget.dropdownValue2 == 'Reliance Jio') {
      // Example conditional logic for Reliance Jio
      print('Fetching data for Reliance Jio');
    }



    var result = await apiService.getfullTT(
      widget.userID,
      widget.dropdownValue2 ?? "VI",
      widget.selectedState ?? "Delhi",
    );

    setState(() {
      if (result != null) {
        availableTabs = _getAvailableTabs(result);
        _controller = TabController(length: availableTabs.length, vsync: this);
      } else {
        // Handle error
      }
      // Check if the operator is Airtel or VI
      if (widget.dropdownValue2 == "Airtel" || widget.dropdownValue2 == "VI") {
        showTopUpPage = true;
      } else {
        showTopUpPage = false;
      }
    });
    if (showTopUpPage) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => TopUp(
          userID: widget.userID,
          selectedState: widget.selectedState,
          dropdownValue2: widget.dropdownValue2,
        ),
      ));
    }
    //this is condition one condition add after when user use Operator name BSNL -- talktime and BSNL...  => data not found
  }

  List<Map<String, dynamic>> _getAvailableTabs(fullTTmodel fullTTModel) {
    List<Map<String, dynamic>> tabs = [];
    if (fullTTModel.data.records.fullTT.isNotEmpty) {
      tabs.add({'title': 'FullTT', 'plans': fullTTModel.data.records.fullTT});
    }
    if (fullTTModel.data.records.topUp.isNotEmpty) {
      tabs.add({'title': 'TopUp', 'plans': fullTTModel.data.records.topUp});
    }
    if (fullTTModel.data.records.threeGFourG.isNotEmpty) {
      tabs.add({'title': '3G/4G', 'plans': fullTTModel.data.records.threeGFourG});
    }
    if (fullTTModel.data.records.twoG.isNotEmpty) {
      tabs.add({'title': '2G', 'plans': fullTTModel.data.records.twoG});
    }
    if (fullTTModel.data.records.roaming.isNotEmpty) {
      tabs.add({'title': 'Roaming', 'plans': fullTTModel.data.records.roaming});
    }
    if (fullTTModel.data.records.comboOffers.isNotEmpty) {
      tabs.add({'title': 'ComboOffers', 'plans': fullTTModel.data.records.comboOffers});
    }
    return tabs;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
        bottom: availableTabs.isEmpty
            ? null
            : TabBar(
          controller: _controller,
          tabs: availableTabs.map((tab) => Tab(text: tab['title'])).toList(),
        ),
      ),
      body: availableTabs.isEmpty
          ? Center(child: CircularProgressIndicator())
          : TabBarView(
        controller: _controller,
        children: availableTabs.map((tab) {
          List<Plan> plans = tab['plans'];
          return ListView.builder(
            itemCount: plans.length,
            itemBuilder: (context, index) {
              Plan plan = plans[index];
              return Card(
                margin: EdgeInsets.all(10),
                elevation: 3,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Validity",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "${plan.validity}",
                            style: TextStyle(fontSize: 12),
                          ),
                          Spacer(),
                          Card(
                            color: Colors.white,
                            elevation: 4,
                            child: Text("   \u{20B9} ${plan.rs}  "),
                          ),
                        ],
                      ),
                      SizedBox(height: 1),
                      Text(
                        "Description",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${plan.desc}",
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(height: 2),
                    ],
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}





//---------------------------simple TabBar -------------------------------

// class MobileRechargeTabBar extends StatefulWidget {
//   final String title;
//   final String userID;
//   final String? selectedState;
//   final String? dropdownValue2; //this is hold the value of the circle
//
//   const MobileRechargeTabBar({
//     super.key,
//     required this.title,
//     required this.userID,
//     this.selectedState,
//     this.dropdownValue2,
//
//   });
//
//   @override
//   State<MobileRechargeTabBar> createState() => _MobileRechargeTabBarState();
// }
//
// class _MobileRechargeTabBarState extends State<MobileRechargeTabBar>with SingleTickerProviderStateMixin {
//   late TabController _controller;
//   late List<Widget> tabBarViews; // Declare as late initialization variable
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = TabController(length: 4, vsync: this);
//     tabBarViews = [
//       TopUp(
//         userID: widget.userID,
//         selectedState: widget.selectedState,
//         dropdownValue2: widget.dropdownValue2,
//       ),
//       threeG(
//         userID: widget.userID,
//         selectedState: widget.selectedState,
//         dropdownValue2: widget.dropdownValue2,
//       ),
//       Roaming(
//         userID: widget.userID,
//         selectedState: widget.selectedState,
//         dropdownValue2: widget.dropdownValue2,
//       ),
//       ComboOffer(
//         userID: widget.userID,
//         selectedState: widget.selectedState,
//         dropdownValue2: widget.dropdownValue2,
//       ),
//       fullTT(
//         userID: widget.userID,
//         selectedState: widget.selectedState,
//         dropdownValue2: widget.dropdownValue2,
//       ),
//     ];
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//
//   // List<Widget> tabBarViews = [
//   //   TopUp(
//   //     userID: widget.userID,
//   //     selectedState: widget.selectedState,
//   //     dropdownValue2: widget.dropdownValue2,
//   //   ),
//   //   threeG(),
//   //   Roaming(),
//   //   ComboOffer(),
//   //
//   // ];
//   // @override
//   // void initState() {
//   //
//   //   super.initState();
//   //   _controller = TabController(length: tabBarViews.length, vsync: this);
//   //   _controller.addListener(() {
//   //     print(_controller.index);
//   //   });
//   // }
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//         length: 2,
//         child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.indigo.shade800,
//             bottom: TabBar(
//               tabs: [
//                Text("TOP UP",style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color: Colors.white),),
//                 Text("3G/4G",style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color: Colors.white),),
//                 Text("ROAMING",style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color: Colors.white),),
//                 Text("COMBO OFFER",style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color: Colors.white),),
//                 Text("FullTT",style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color: Colors.white),),
//
//               ],
//               onTap: (index){
//                 print(index);
//               },
//               controller: _controller,
//             ),
//             title: Text(widget.title,style: TextStyle(color: Colors.white),),
//           ),
//           body: Center(
//             child: TabBarView(
//               controller: _controller,
//               children:
//                 tabBarViews,
//
//             ),
//           ),
//         ),
//
//     );
//   }
// }


