// class BrowsePlanModel {
//   String? statuscode;
//   String? status;
//   String? data;
//
//   BrowsePlanModel({this.statuscode, this.status, this.data});
//
//   BrowsePlanModel.fromJson(Map<String, dynamic> json) {
//     statuscode = json['statuscode'];
//     status = json['status'];
//     data = json['data'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['statuscode'] = this.statuscode;
//     data['status'] = this.status;
//     data['data'] = this.data;
//     return data;
//   }
// }


//here is the json to dart model
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'BrowsePlanModel.g.dart';



@JsonSerializable()
class BrowsePlanModel {
  final String statuscode;
  final String status;
  final InnerData? data;

  BrowsePlanModel({
    required this.statuscode,
    required this.status,
     this.data,
  });

  factory BrowsePlanModel.fromJson(Map<String, dynamic> json) => _$BrowsePlanModelFromJson(json);
  Map<String, dynamic> toJson() => _$BrowsePlanModelToJson(this);
}

@JsonSerializable()
class InnerData {
  final Records? records;//
  final int? status;
  final double? time;

  InnerData({
     this.records,//
     this.status,
     this.time,
  });

  factory InnerData.fromJson(Map<String, dynamic> json) {
    // Decode the `records` field if it's a string
    if (json['records'] is String) {
      json['records'] = jsonDecode(json['records']);
    }
    return _$InnerDataFromJson(json);
  }
  Map<String, dynamic> toJson() => _$InnerDataToJson(this);
}

@JsonSerializable()
class Records {
  @JsonKey(name: 'TOPUP')
  final List<Plan>? topup;

  @JsonKey(name: '3G/4G')
  final List<Plan>? threeGFourG;

  @JsonKey(name: 'Romaing')
  final List<Plan>? romaing;

  @JsonKey(name: 'COMBO')
  final List<Plan>? combo;

  final String? msg; // Add this line to handle error messages

  Records({
     this.topup,
     this.threeGFourG,
     this.romaing,
     this.combo,
    this.msg,
  });

  factory Records.fromJson(Map<String, dynamic> json) => _$RecordsFromJson(json);
  Map<String, dynamic> toJson() => _$RecordsToJson(this);
}

@JsonSerializable()
class Plan {
  final String rs;
  final String desc;
  final String validity;

  @JsonKey(name: 'last_update')
  final String lastUpdate;

  Plan({
    required this.rs,
    required this.desc,
    required this.validity,
    required this.lastUpdate,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);
  Map<String, dynamic> toJson() => _$PlanToJson(this);
}
