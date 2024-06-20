// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:payoneclick/Api_Services/Api_Service.dart';
// import 'package:payoneclick/Api_Services/Api_models/DTH_BrowseModel/DTH_BrowseModelSundirect/DTH_browsePlanSundirectModel.dart';

// if this is perfectly work delete this file

// class DthBrowsePlanSundirectg extends StatefulWidget {
//   final String userID;
//   final String? dropdownValue2; // this holds operator name
//   final String? subscribeIDcontroller;
//
//
//   const DthBrowsePlanSundirectg({
//     super.key, required this.userID,required this.dropdownValue2, this.subscribeIDcontroller,
//
//   });
//
//   @override
//   State<DthBrowsePlanSundirectg> createState() => _DthBrowsePlanSundirectgState();
// }
//
// class _DthBrowsePlanSundirectgState extends State<DthBrowsePlanSundirectg> {
//  // Future<DthBrowse_SundirectModel?>? futurePlan;
//   late Future<DthBrowse_SundirectModel?> futurePlan;
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   fetchPlanData();
//   // }
//   //
//   // void fetchPlanData() {
//   //   final apiServices = ApiServices();
//   //   futurePlan = apiServices.getDthBrowsePlan_Sundirect(
//   //     widget.userID,
//   //     widget.dropdownValue2 ?? 'Sundirect',
//   //     widget.subscribeIDcontroller ?? '',
//   //   );
//   // }
//
//   @override
//   void initState() {
//     super.initState();
//     ApiServices apiServices = ApiServices();
//     // futurePlan = apiServices.getDthBrowsePlan_Sundirect(widget.userID,widget.dropdownValue2 ?? 'Sundirect', widget.subscribeIDcontroller ?? '');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('DTH Plans'),
//       ),
//       body: FutureBuilder<DthBrowse_SundirectModel?>(
//         future: futurePlan,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (snapshot.hasData) {
//             final plan = snapshot.data!.data.records.plan;
//             return ListView.builder(
//               itemCount: plan.length,
//               itemBuilder: (context, index) {
//                 final item = plan[index];
//                 // Access the specific subscription durations
//                 String rs1Month = item.rs['1 MONTHS'] ?? 'N/A';
//                 String rs6Months = item.rs['6 MONTHS'] ?? 'N/A';
//                 String rs3Months = item.rs['3 MONTHS'] ?? 'N/A';
//
//                 return Card(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(item.planName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                       SizedBox(height: 4),
//                       Text(item.desc),
//                       SizedBox(height: 4),
//                       Text('Last Update: ${item.lastUpdate}'),
//                       SizedBox(height: 4),
//                       Text('1 Month RS: $rs1Month'),
//                       Text('6 Months RS: $rs6Months'),
//                       Text('3 Months RS: $rs3Months'),
//                     ],
//                   ),
//                 );
//               },
//             );
//
//           } else {
//             return Center(child: Text('No data available'));
//           }
//         },
//       ),
//     );
//   }
// }