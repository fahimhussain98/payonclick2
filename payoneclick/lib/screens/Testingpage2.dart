// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:intl/intl.dart';
// import 'package:payoneclick/Api_Services/Api_Service.dart';
// import 'package:html/parser.dart' show parse;
// import 'package:payoneclick/Api_Services/Api_models/BrowsePlan%20Model/BrowsePlanModel.dart';
// import 'package:payoneclick/Drawer/MyCustomDrawer.dart';
// import 'package:payoneclick/Slips/RechargeTransactionSlip.dart';
// import 'package:share/share.dart';
//
// class Testingpage2 extends StatefulWidget {
//   const Testingpage2({super.key});
//
//   @override
//   State<Testingpage2> createState() => _Testingpage2State();
// }
//
// class _Testingpage2State extends State<Testingpage2> {
//   BrowsePlanModel? browsePlan;
//
//   List<String> statuses = [];
//   List<int> statusesInner= [];  //me ek hi data hai jo 1 hai
//   List<double> times=[];       //me ek hi data hai jo 1 hai
//   List<Plan>topups = [];
//
//   List<Plan> threeGFourGs = [];   //ye Airtel me show hoga
//   List<Plan>  romaings = [];
//   List<Plan> combos =[];
//   //----------------------------------------
//   List<String>rsList = [];
//   List<String>descList =[];
//   List<String>validityList =[];
//   List<String>lastUpdateList =[];
//
//
//   @override
//   void initState() {
//     super.initState();
//     fetchBrowsePlan();
//   }
//
//   Future<void> fetchBrowsePlan() async {
//     ApiServices apiServices = ApiServices();
//     BrowsePlanModel? fetchedPlan = await apiServices.getBrowsePlan("AhCtz8JqpO6LjhrAYpZCiFunsKFHQMXB", "Airtel", "Delhi");
//     if(fetchedPlan != null){
//       setState(() {
//         browsePlan = fetchedPlan;
//         statuses.add(fetchedPlan.status);
//         statusesInner.add(fetchedPlan.data.status);
//         times.add(fetchedPlan.data.time);
//         //_________________________________
//         topups.addAll(fetchedPlan.data.records.topup);
//         //___________________________________________
//         threeGFourGs.addAll(fetchedPlan.data.records.threeGFourG); // Airtel
//         romaings.addAll(fetchedPlan.data.records.romaing);
//         combos.addAll(fetchedPlan.data.records.combo);
//         //-------------------------------------------
//         for (var plann in fetchedPlan.data.records.topup) {
//           rsList.add(plann.rs);
//           descList.add(plann.desc);
//           validityList.add(plann.validity);
//           lastUpdateList.add(plann.lastUpdate);
//         }
//         for (var plannn in fetchedPlan.data.records.threeGFourG) {
//           rsList.add(plannn.rs);
//           descList.add(plannn.desc);
//           validityList.add(plannn.validity);
//           lastUpdateList.add(plannn.lastUpdate);
//         }
//         for (var plan4 in fetchedPlan.data.records.romaing) {
//           rsList.add(plan4.rs);
//           descList.add(plan4.desc);
//           validityList.add(plan4.validity);
//           lastUpdateList.add(plan4.lastUpdate);
//         }
//         for (var plan6 in fetchedPlan.data.records.combo) {
//           rsList.add(plan6.rs);
//           descList.add(plan6.desc);
//           validityList.add(plan6.validity);
//           lastUpdateList.add(plan6.lastUpdate);
//         }
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
//       });
//
//     }
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: browsePlan == null
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//         itemCount: browsePlan!.data.records.topup.length,
//         itemBuilder: (context, index) {
//           Plan plan = browsePlan!.data.records.topup[index];
//           return Card(
//             child:
//             Column(
//               children: [
//                 Text("Status :: ${statuses}"),
//                 Text("InnerStatus: ${statusesInner}"),
//                 Text("Time: ${times}"),
//                 //_____________________
//                 Text("TopUps::${topups}"),
//                 Text("TopUp ke andar Rs: ${plan.rs}",style: TextStyle(color: Colors.teal),),
//                 Text("TopUpke andhr desc::: ${plan.desc}",style: TextStyle(color: Colors.purple),),
//                 Text("TopUpke andhr lastUpdate::: ${plan.lastUpdate}",style: TextStyle(color: Colors.green),),
//                 Text("TopUpke andhr validity::: ${plan.validity}",style: TextStyle(color: Colors.pink),),
//                 Text("TopUpke andhr lastUpdate::: ${plan.lastUpdate}",style: TextStyle(color: Colors.indigo),),
//                 //_________________________________________
//                 Text("threeGFourGs::${threeGFourGs}"),
//                 Text("roaming hai  ::${romaings}"),
//                 Text("Comboo hai  ::${combos}"),
//                 //______________________________________
//                 Text("ye plann ke data.records.topup Rs:: ${rsList}"),
//                 Text("ye plann ke data.records.topup desc: ${descList}"),
//                 Text("ye plann ke data.records.topup lastUpdate: ${lastUpdateList }"),
//                 Text("ye plann ke data.records.topup validityList: ${validityList }"),
//                 //__________________________________________________
//                 Text("_________________________________________________________"),
//                 Text(" fetchedPlan.data.records.threeGFourG Rs:: ${rsList}"),
//                 Text("plann ke fetchedPlan.data.records.threeGFourG desc: ${descList}"),
//                 Text("plann ke fetchedPlan.data.records.threeGFourG lastUpdate: ${lastUpdateList }"),
//                 Text("plann ke fetchedPlan.data.records.threeGFourG validityList: ${validityList }"),
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
//
//               ],
//             ),
//
//
//
//           );
//         },
//       ),
//     );
//   }
// }
//
//
//
// //
// // ListTile(
// // title: Text(plan.desc),
// // subtitle: Text('Rs: ${plan.rs}, Validity: ${plan.validity}'),
// // );