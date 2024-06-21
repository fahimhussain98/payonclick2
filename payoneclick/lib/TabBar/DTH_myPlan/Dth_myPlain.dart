import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payoneclick/Api_Services/Api_Service.dart';
import 'package:payoneclick/Api_Services/Api_models/DTH_MyPlainmodel/DTH_myPlainModel.dart';

class Dth_myPlain extends StatefulWidget {
  final String title;
  final String userID;
  final String? dropdownValue2; // this holds DTH operator name
  final int mobileNumber;

  const Dth_myPlain({super.key, required this.title, required this.userID, this.dropdownValue2, required this.mobileNumber});

  @override
  State<Dth_myPlain> createState() => _Dth_myPlainState();
}

class _Dth_myPlainState extends State<Dth_myPlain> {
  late Future<DthMyPlanModel?> _futureDthMyPlan;

  @override
  void initState() {
    super.initState();
    _futureDthMyPlan = ApiServices().getDthMyPlain(widget.userID, widget.dropdownValue2 ?? '', widget.mobileNumber);
  }
  //-------------------------------------------------------------
  void _showAlertDialog(BuildContext context, DthMyPlanModel data) {
    var records = data.data.records is List ? data.data.records as List<DthMyPlanRecord> : [data.data.records as DthMyPlanRecord];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Dth My Plan Details'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Tel: ${data.data.tel}'),
                Text('Operator: ${data.data.operator}'),
                SizedBox(height: 20),
                Text('Records:', style: TextStyle(fontWeight: FontWeight.bold)),
                ...records.map((record) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Status: ${record.status}'),
                        Text('Description: ${record.desc}'),
                      ],
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Dth My Plan'),
      ),
      body: FutureBuilder<DthMyPlanModel?>(
        future: _futureDthMyPlan,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No data available'));
          } else {
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              _showAlertDialog(context, snapshot.data!);
            });
            return Center(child: Text('Data Loaded. Ruk jyoo...'));
          }
        },
      ),
    );
  }
}

  //-------------------- simple define the data --------------------
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dth My Plan'),
//       ),
//       body: FutureBuilder<DthMyPlanModel?>(
//         future: _futureDthMyPlan,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data == null) {
//             return Center(child: Text('No data available'));
//           } else {
//             var data = snapshot.data!.data;
//             var records = data.records is List ? data.records as List<DthMyPlanRecord> : [data.records as DthMyPlanRecord];
//
//             return Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Tel: ${data.tel}'),
//                   Text('Operator: ${data.operator}'),
//                   SizedBox(height: 20),
//                   Text('Records:', style: TextStyle(fontWeight: FontWeight.bold)),
//                   ...records.map((record) {
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 8.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Status: ${record.status}'),
//                           Text('Description: ${record.desc}'),
//                         ],
//                       ),
//                     );
//                   }).toList(),
//                 ],
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }