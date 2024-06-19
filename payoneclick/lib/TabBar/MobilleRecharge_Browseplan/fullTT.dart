import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payoneclick/Api_Services/APIService2.dart';
import 'package:payoneclick/Api_Services/Api_Service.dart';
import 'package:payoneclick/Api_Services/Api_models/TabBarModel/fullTTModel.dart';

class fullTT extends StatefulWidget {
  final String userID;
  final String? selectedState;
  final String? dropdownValue2; // this holds operator name


  const fullTT({super.key, required this.userID, this.selectedState, this.dropdownValue2,});

  @override
  State<fullTT> createState() => _fullTTState();
}

class _fullTTState extends State<fullTT> with SingleTickerProviderStateMixin{
  fullTTmodel? FullttModel;
  String? errorMessage;
  TabController? _tabController; //
  @override
  void initState() {
    super.initState();
    fetchFullTTData();

  }

  Future<void> fetchFullTTData() async {
    APISerives2 apiService = APISerives2();
    // var result = await apiService.getfullTT('AhCtz8JqpO5ZZSAo4QSneFunsKFHQMXB', 'Reliance Jio', 'Delhi NCR');
    var result = await apiService.getfullTT(
      widget.userID,
      widget.dropdownValue2 ?? "VI",
      widget.selectedState ?? "Delhi",
    );

    setState(() {
      FullttModel = result;
      if (result == null) {
        errorMessage = 'Failed to load data';
      }else{
        _tabController = TabController(
          length: _getAvailableTabs().length,
          vsync: this,

        );
      }
    });
  }
  List<Map<String, dynamic>> _getAvailableTabs() {
    List<Map<String, dynamic>> tabs = [];
    if (FullttModel?.data.records.fullTT.isNotEmpty ?? false) {
      tabs.add({'title': 'FullTT', 'plans': FullttModel!.data.records.fullTT});
    }
    if (FullttModel?.data.records.topUp.isNotEmpty ?? false) {
      tabs.add({'title': 'TopUp', 'plans': FullttModel!.data.records.topUp});
    }
    if (FullttModel?.data.records.threeGFourG.isNotEmpty ?? false) {
      tabs.add({'title': '3G/4G', 'plans': FullttModel!.data.records.threeGFourG});
    }
    if (FullttModel?.data.records.twoG.isNotEmpty ?? false) {
      tabs.add({'title': '2G', 'plans': FullttModel!.data.records.twoG});
    }
    if (FullttModel?.data.records.roaming.isNotEmpty ?? false) {
      tabs.add({'title': 'Roaming', 'plans': FullttModel!.data.records.roaming});
    }
    if (FullttModel?.data.records.comboOffers.isNotEmpty ?? false) {
      tabs.add({'title': 'ComboOffers', 'plans': FullttModel!.data.records.comboOffers});
    }
    return tabs;

  }




  @override
  Widget build(BuildContext context) {
    var availableTabs = _getAvailableTabs();

    return Scaffold(
      appBar: AppBar(
        title: Text("Combo Offers"),
        bottom: _tabController != null
            ? TabBar(
          controller: _tabController,
          tabs: availableTabs.map((tab) => Tab(text: tab['title'])).toList(),
        )
            : null,
      ),
      body: Center(
        child: FullttModel == null
            ? Container(
          child: Center(
            child: Text(
              "Data not found...",
              style: TextStyle(fontSize: 14),
            ),
          ),
        )
            : errorMessage != null
            ? Text('Error: $errorMessage')
            : _tabController != null
            ? TabBarView(
          controller: _tabController,
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
        )
            : Container(
          child: Center(
            child: Text(
              "Loading...",
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
      ),
    );

    // return Scaffold(
    //   body: Center(
    //     child: FullttModel == null
    //         ? Container(child: Center(child: Text("Loading data...",style: TextStyle(fontSize: 14,),)),)
    //         : errorMessage != null
    //         ? Text('Error: $errorMessage')
    //         : ListView.builder(
    //       itemCount: FullttModel!.data?.records?.fullTT?.length ?? 0,
    //       itemBuilder: (context, index) {
    //         Plan plan = FullttModel!.data!.records!.fullTT![index];
    //         return Card(
    //           margin: EdgeInsets.all(10),
    //           elevation: 3,
    //           color: Colors.white,
    //           child: Padding(
    //             padding: const EdgeInsets.all(15),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Text(
    //                   "Validity",
    //                   style: TextStyle(
    //                     color: Colors.blue,
    //                     fontSize: 16,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //                 Row(
    //                   children: [
    //                     Text(
    //                       "${plan.validity}",
    //                       style: TextStyle(fontSize: 12),
    //                     ),
    //                     Spacer(),
    //                     Card(
    //                       color: Colors.white,
    //                       elevation: 4,
    //                       child: Text("   \u{20B9} ${plan.rs}  "),
    //                     ),
    //                   ],
    //                 ),
    //                 SizedBox(height: 1),
    //                 Text(
    //                   "Description",
    //                   style: TextStyle(
    //                     color: Colors.blue,
    //                     fontSize: 16,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //                 Text(
    //                   "${plan.desc}",
    //                   style: TextStyle(fontSize: 12),
    //                 ),
    //                 SizedBox(height: 2),
    //               ],
    //             ),
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    // );
  }
}


//___----------------------------------------------------
// fullTTmodel? FullttModel;
// String? errorMessage;
//
// @override
// void initState() {
//   super.initState();
//   // Add the method to fetch data here
//   fetchFullTTData();
// }
//
// Future<void> fetchFullTTData() async {
//   APISerives2 apiService = APISerives2();
//   var result = await apiService.getfullTT('userID', 'operatorName', 'selectedState');
//   setState(() {
//     FullttModel = result;
//     if (result == null) {
//       errorMessage = 'Failed to load data';
//     }
//   });
// }
//
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(title: Text("Combo Offers")),
//     body: Center(
//       child: FullttModel == null
//           ? Container(
//         child: Center(
//           child: Text(
//             "Loading data...",
//             style: TextStyle(fontSize: 14),
//           ),
//         ),
//       )
//           : errorMessage != null
//           ? Text('Error: $errorMessage')
//           : ListView.builder(
//         itemCount: FullttModel!.data.comboOffers.length,
//         itemBuilder: (context, index) {
//           Plan plan = FullttModel!.data.comboOffers[index];
//           return Card(
//             margin: EdgeInsets.all(10),
//             elevation: 3,
//             color: Colors.white,
//             child: Padding(
//               padding: const EdgeInsets.all(15),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Validity",
//                     style: TextStyle(
//                       color: Colors.blue,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         "${plan.validity}",
//                         style: TextStyle(fontSize: 12),
//                       ),
//                       Spacer(),
//                       Card(
//                         color: Colors.white,
//                         elevation: 4,
//                         child: Text("   \u{20B9} ${plan.rs}  "),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 1),
//                   Text(
//                     "Description",
//                     style: TextStyle(
//                       color: Colors.blue,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     "${plan.desc}",
//                     style: TextStyle(fontSize: 12),
//                   ),
//                   SizedBox(height: 2),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     ),
//   );
// }
// }
