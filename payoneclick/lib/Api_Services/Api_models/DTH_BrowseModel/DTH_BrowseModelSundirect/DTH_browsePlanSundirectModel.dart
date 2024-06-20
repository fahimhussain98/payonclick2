// import 'dart:convert';
//
// class DthBrowse_SundirectModel {
//   final String statuscode;
//   final String status;
//   final SundirectModel_Data data;
//
//   DthBrowse_SundirectModel({
//     required this.statuscode,
//     required this.status,
//     required this.data,
//   });
//
//   factory DthBrowse_SundirectModel.fromJson(Map<String, dynamic> json) {
//     // // Handle decoding of 'data' correctly
//     var dataJson = json['data'];
//
//     if (dataJson is String) {
//       dataJson = jsonDecode(dataJson); // Decode if 'data' is a string
//     }
//
//     return DthBrowse_SundirectModel(
//       statuscode: json['statuscode'],
//       status: json['status'],
//       data: SundirectModel_Data.fromJson(dataJson),
//
//       // data: SundirectModel_Data.fromJson(jsonDecode(json['data'])),
//
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'statuscode': statuscode,
//       'status': status,
//       'data': jsonEncode(data.toJson()),
//     };
//   }
// }
//
// class SundirectModel_Data {
//   final SundirectModel_Records records;
//   final int status;
//
//   SundirectModel_Data({
//     required this.records,
//     required this.status,
//   });
//
//   factory SundirectModel_Data.fromJson(Map<String, dynamic> json) {
//     return SundirectModel_Data(
//       records: SundirectModel_Records.fromJson(json['records']),
//       status: json['status'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'records': records.toJson(),
//       'status': status,
//     };
//   }
// }
//
// class SundirectModel_Records {
//   final List<SundirectModel_Plan> plan;
//
//   SundirectModel_Records({
//     required this.plan,
//   });
//
//   factory SundirectModel_Records.fromJson(Map<String, dynamic> json) {
//     var list = json['Plan'] as List;
//     List<SundirectModel_Plan> planList = list.map((i) => SundirectModel_Plan.fromJson(i)).toList();
//
//     return SundirectModel_Records(
//       plan: planList,
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'Plan': plan.map((e) => e.toJson()).toList(),
//     };
//   }
// }
//
// class SundirectModel_Plan {
//   final Map<String, String> rs;
//   final String desc;
//   final String planName;
//   final String lastUpdate;
//
//   SundirectModel_Plan({
//     required this.rs,
//     required this.desc,
//     required this.planName,
//     required this.lastUpdate,
//   });
//
//   factory SundirectModel_Plan.fromJson(Map<String, dynamic> json) {
//     return SundirectModel_Plan(
//       rs: Map<String, String>.from(json['rs']),
//       desc: json['desc'],
//       planName: json['plan_name'],
//       lastUpdate: json['last_update'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'rs': rs,
//       'desc': desc,
//       'plan_name': planName,
//       'last_update': lastUpdate,
//     };
//   }
// }