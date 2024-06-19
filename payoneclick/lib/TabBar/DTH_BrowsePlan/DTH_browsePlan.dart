import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payoneclick/Api_Services/Api_Service.dart';
import 'package:payoneclick/Api_Services/Api_models/DTH_BrowseModel/DthBrowseModel.dart';

class DthBrowsePlan extends StatefulWidget {
  const DthBrowsePlan({super.key});

  @override
  State<DthBrowsePlan> createState() => _DthBrowsePlanState();
}

class _DthBrowsePlanState extends State<DthBrowsePlan> {
  final ApiServices _apiServices = ApiServices();
  DthBrowseModelTransaction? _browseModelTransaction;

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch data when widget initializes
  }

  Future<void> fetchData() async {
    String userID = 'AhCtz8JqpO6lmo+yME0q5VunsKFHQMXB';
    String dropdownValue2 = 'Videocon DTH';
    String subscribeIDcontroller = '8448505251';

    var result = await _apiServices.getDthBrowsePlan(userID, dropdownValue2, subscribeIDcontroller);
    setState(() {
      _browseModelTransaction = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DTH Plan'),
        backgroundColor: Colors.blue,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_browseModelTransaction == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return ListView.builder(
        itemCount: _browseModelTransaction!.data.records.plan.length,
        itemBuilder: (BuildContext context, int index) {
          DthBrowse_Plan plan = _browseModelTransaction!.data.records.plan[index];
          return _buildPlanCard(plan);
        },
      );
    }
  }

  Widget _buildPlanCard(DthBrowse_Plan plan) {
    return Card(
      elevation: 5,
      color: Colors.white,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${plan.planName}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text('${plan.desc}', style: TextStyle(fontSize: 14)),
            SizedBox(height: 5),
            // Text('Last Updated: ${plan.lastUpdate}', style: TextStyle(fontSize: 12, color: Colors.grey)),
           // SizedBox(height: 10),
            Text('Details:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            _buildDetailsList(plan.rs),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailsList(Map<String, String> rs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: rs.entries.map((entry) {
        return Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text('${entry.key}:  \u{20B9}${entry.value}', style: TextStyle(fontSize: 12)),
        );
      }).toList(),
    );
  }
}
//____________________________________
// @override
// Widget build(BuildContext context) {
//   return   Scaffold(
//     appBar: AppBar(
//       title: Text('DTH Plan'),
//       backgroundColor: Colors.blue,
//     ),
//     body: _buildBody(),
//   );
// }
//
// Widget _buildBody() {
//   if (_browseModelTransaction == null) {
//     return Center(child: CircularProgressIndicator());
//   } else {
//     // Access your data and display it in your UI
//     return Container(
//       margin: EdgeInsets.only(left: 5, right: 5, top: 35),
//       height: 250,
//       width: double.infinity,
//       color: Colors.yellow,
//       child: Stack(
//         children: [
//           Positioned(
//             top: 5,
//             right: 5,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: _buildPlanCards(), // Build cards dynamically
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Total Channel ${_browseModelTransaction!.data.records.plan.length}', // Example usage of data
//                   style: TextStyle(color: Colors.deepPurple),
//                 ),
//                 SizedBox(height: 50),
//                 Container(
//                   width: 180,
//                   color: Colors.transparent,
//                   child: Text(
//                     'INTRODUCTORY VALUE COMBO OFFER PACK @129',
//                     style: TextStyle(color: Colors.deepPurple, fontSize: 12),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//
//   }
// }
// List<Widget> _buildPlanCards() {
//   List<DthBrowse_Plan> plans = _browseModelTransaction!.data.records.plan;
//
//   return plans.map((plan) {
//     return Column(
//       children: [
//         Card(
//           elevation: 5,
//           child: Container(
//             width: 130,
//             height: 45,
//             alignment: Alignment.center,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 5),
//                   child: Text('\u{20B9}${plan.rs['your_field']}', style: TextStyle(fontSize: 12)),
//                 ),
//                 Text('Validity: ${plan.desc}', style: TextStyle(fontSize: 10, color: Colors.black)),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(height: 5),
//       ],
//     );
//   }).toList();
// }
// }
