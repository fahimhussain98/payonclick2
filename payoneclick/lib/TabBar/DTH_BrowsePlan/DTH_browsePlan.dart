import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:payoneclick/Api_Services/Api_Service.dart';
import 'package:payoneclick/Api_Services/Api_models/DTH_BrowseModel/DthBrowseModel.dart';
import 'package:payoneclick/TabBar/DTH_BrowsePlan/DTH_browsePlanForSundirct.dart';


class DthBrowsePlan extends StatefulWidget {
  final String title;
  final String userID;
  final String? dropdownValue2; // this holds operator name
  final String? subscribeIDcontroller;
  // final Function(String) onAmountSelected; // Add this line

  const DthBrowsePlan({
    super.key,
    required this.title,
    required this.userID,
    this.dropdownValue2,
    this.subscribeIDcontroller,
    //required this.onAmountSelected,
  });

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
    try {
      var result = await _apiServices.getDthBrowsePlan(
        widget.userID,
        widget.dropdownValue2 ?? '',
        widget.subscribeIDcontroller ?? '',
      );
      setState(() {
        _browseModelTransaction = result;
      });
      //if (widget.dropdownValue2 == 'Sundirect') {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => DthBrowsePlanSundirectg(
        //     userID: widget.userID,
        //     dropdownValue2: widget.dropdownValue2,
        //     subscribeIDcontroller: widget.subscribeIDcontroller,
        //   )),
        // );
    //  }
    } catch (e) {
      print('Error fetching data: $e');
      // Handle error here, e.g., show error message to user
    }
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
    return GestureDetector(
      onTap: () {
        String amount = plan.rs.values.first ?? 'pese nai laya'; // Assuming you want the first amount in the map
        Navigator.pop(context, amount); // Pass the amount back to the previous screen
      },
      child: Card(
        elevation: 5,
        color: Colors.white,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${plan.planName}', style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal)),
              SizedBox(height: 5),
              Text('${plan.desc}', style: TextStyle(fontSize: 12)),
              SizedBox(height: 5),
              Text('Details:', style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal)),
              SizedBox(height: 5),
              _buildDetailsList(plan.rs),
            ],
          ),
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


// class _DthBrowsePlanState extends State<DthBrowsePlan> {
//   final ApiServices _apiServices = ApiServices();
//   DthBrowseModelTransaction? _browseModelTransaction;
//   bool showTopUpPage = false;
//
//
//   @override
//   void initState() {
//     super.initState();
//     fetchData(); // Fetch data when widget initializes
//   }
//
//   // Future<void> fetchData() async {
//   //   // ApiServices apiService = ApiServices();
//   //   // var result = await apiService.getDthBrowsePlan(
//   //   //   widget.userID,
//   //   //   widget.dropdownValue2 ?? "sundirect",
//   //   //   widget.subscribeIDcontroller ?? ""
//   //   // );
//   //   // setState(() {
//   //   //   if(result != null){
//   //   //     _browseModelTransaction = result;
//   //   //   }else{
//   //   //     //handle the erroe
//   //   //   }
//   //   //
//   //   //   // Check if the operator is Airtel or VI
//   //   //   if (widget.dropdownValue2?.toLowerCase() == "SUNDIRECT" ) {
//   //   //     showTopUpPage = true;
//   //   //   } else {
//   //   //     showTopUpPage = false;
//   //   //   }
//   //   //
//   //   //
//   //   // });
//   //   // if (showTopUpPage) {
//   //   //   Navigator.of(context).pushReplacement(MaterialPageRoute(
//   //   //     builder: (context) => DthBrowsePlanSundirectg(
//   //   //         userID: widget.userID,
//   //   //         dropdownValue2:  widget.dropdownValue2,
//   //   //         subscribeIDcontroller : widget.subscribeIDcontroller,
//   //   //     ),
//   //   //   ));
//   //   // }
//   //   try {
//   //     var result = await _apiServices.getDthBrowsePlan(
//   //       widget.userID,
//   //       widget.dropdownValue2 ?? '',
//   //       widget.subscribeIDcontroller ?? '',
//   //     );
//   //     setState(() {
//   //       _browseModelTransaction = result;
//   //     });
//   //     if (widget.dropdownValue2 == 'Sundirect') {
//   //       Navigator.push(
//   //         context,
//   //         MaterialPageRoute(builder: (context) => DthBrowsePlanSundirectg(
//   //           userID: widget.userID,
//   //           dropdownValue2: widget.dropdownValue2,
//   //           subscribeIDcontroller: widget.subscribeIDcontroller,
//   //         )),
//   //       );
//   //     }
//   //   } catch (e) {
//   //     print('Error fetching data: $e');
//   //     // Handle error here, e.g., show error message to user
//   //   }
//   //   // // Conditionally redirect to DthBrowsePlanSundirectg screen if subscribeIDcontroller is 'Sundirect'
//   //   // // Conditionally navigate to DthBrowsePlanSundirectg if dropdownValue2 is 'Sundirect'
//   //
//   // }
//
//   Future<void> fetchData() async {
//     try {
//       if (widget.dropdownValue2 == 'Sundirect') {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => DthBrowsePlanSundirectg(
//             userID: widget.userID,
//             dropdownValue2: widget.dropdownValue2,
//             subscribeIDcontroller: widget.subscribeIDcontroller,
//           )),
//         );
//         return;
//       }
//
//       var result = await _apiServices.getDthBrowsePlan(
//         widget.userID,
//         widget.dropdownValue2 ?? '',
//         widget.subscribeIDcontroller ?? '',
//       );
//
//       setState(() {
//         _browseModelTransaction = result;
//       });
//     } catch (e) {
//       print('Error fetching data: $e');
//     }
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('DTH Plan'),
//         backgroundColor: Colors.blue,
//       ),
//       body: _buildBody(),
//     );
//   }
//
//   Widget _buildBody() {
//     if (_browseModelTransaction == null) {
//       return Center(child: CircularProgressIndicator());
//     } else {
//       return ListView.builder(
//         itemCount: _browseModelTransaction!.data.records.plan.length,
//         itemBuilder: (BuildContext context, int index) {
//           DthBrowse_Plan plan = _browseModelTransaction!.data.records.plan[index];
//           return _buildPlanCard(plan);
//         },
//       );
//     }
//   }
//
//   Widget _buildPlanCard(DthBrowse_Plan plan) {
//     return GestureDetector(
//       onTap: (){
//         String amount = plan.rs.values.first ?? 'pese nai laya'; // Assuming you want the first amount in the map
//         // print("Selected Amount: $amount"); // Debug print
//         Navigator.pop(context, amount); // Pass the amount back to the previous screen
//
//       },
//       child: Card(
//         elevation: 5,
//         color: Colors.white,
//         child: Container(
//           width: double.infinity,
//           padding: EdgeInsets.all(10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('${plan.planName}', style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal)),
//               SizedBox(height: 5),
//               Text('${plan.desc}', style: TextStyle(fontSize: 12)),
//               SizedBox(height: 5),
//               Text('Details:', style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal)),
//               SizedBox(height: 5),
//               _buildDetailsList(plan.rs),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDetailsList(Map<String, String> rs) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: rs.entries.map((entry) {
//         return Padding(
//           padding: EdgeInsets.only(left: 10),
//           child: Text('${entry.key}:  \u{20B9}${entry.value}', style: TextStyle(fontSize: 12)),
//         );
//       }).toList(),
//     );
//   }
// }

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
