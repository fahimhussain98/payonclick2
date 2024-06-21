import 'dart:convert';
import 'package:http/http.dart' as http;

class DthMyPlanModel {
  String statuscode;
  String status;
  DthMyPlanData data;

  DthMyPlanModel({
    required this.statuscode,
    required this.status,
    required this.data,
  });

  factory DthMyPlanModel.fromJson(Map<String, dynamic> json) {
    return DthMyPlanModel(
      statuscode: json['statuscode'],
      status: json['status'],
      // data: DthMyPlanData.fromJson(jsonDecode(json['data'])),
      data: DthMyPlanData.fromJson(json['data'] is String ? jsonDecode(json['data']) : json['data']),


    );
  }
}

class DthMyPlanData {
  String tel;
  String operator;
  dynamic records; // Can be either a List or a Map
  int status;

  DthMyPlanData({
    required this.tel,
    required this.operator,
    required this.records,
    required this.status,
  });

  factory DthMyPlanData.fromJson(Map<String, dynamic> json) {
    return DthMyPlanData(
      tel: json['tel'],
      operator: json['operator'],
      records: json['records'] is List
          ? List<DthMyPlanRecord>.from(json['records'].map((record) => DthMyPlanRecord.fromJson(record)))
          : DthMyPlanRecord.fromJson(json['records']),
      status: json['status'],
    );
  }
}

class DthMyPlanRecord {
  int? status;
  String? rs;
  String? desc;

  DthMyPlanRecord({
    this.status,
    this.rs,
    this.desc,
  });

  factory DthMyPlanRecord.fromJson(Map<String, dynamic> json) {
    return DthMyPlanRecord(
      status: json['status'],
      rs: json['rs']?.toString(), // Convert to String if needed
      desc: json['desc'],
    );
  }
}
