import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
part 'DthBrowseModel.g.dart';


@JsonSerializable()
class DthBrowseModelTransaction {
  @JsonKey(name: 'statuscode')
  final String statusCode;
  final String status;
  final DthBrowse_Data data;

  DthBrowseModelTransaction({
    required this.statusCode,
    required this.status,
    required this.data,
  });

  factory DthBrowseModelTransaction.fromJson(Map<String, dynamic> json) => _$DthBrowseModelTransactionFromJson(json);
  Map<String, dynamic> toJson() => _$DthBrowseModelTransactionToJson(this);
}

@JsonSerializable()
class DthBrowse_Data {
  final DthBrowse_Records records;
  final int status;

  DthBrowse_Data({
    required this.records,
    required this.status,
  });

  factory DthBrowse_Data.fromJson(Map<String, dynamic> json) => _$DthBrowse_DataFromJson(json);
  Map<String, dynamic> toJson() => _$DthBrowse_DataToJson(this);
}

@JsonSerializable()
class DthBrowse_Records {
  @JsonKey(name: 'Plan', defaultValue: [])
  final List<DthBrowse_Plan> plan;
  @JsonKey(name: 'Add-On Pack', defaultValue: [])
  final List<AddOnPack> addOnPack;

  DthBrowse_Records({
    required this.plan,
    required this.addOnPack,
  });

  factory DthBrowse_Records.fromJson(Map<String, dynamic> json) => _$DthBrowse_RecordsFromJson(json);
  Map<String, dynamic> toJson() => _$DthBrowse_RecordsToJson(this);
}

@JsonSerializable()
class DthBrowse_Plan {
  @JsonKey(defaultValue: {})
  final Map<String, String> rs;
  final String desc;
  @JsonKey(name: 'plan_name')
  final String planName;
  @JsonKey(name: 'last_update')
  final String lastUpdate;

  DthBrowse_Plan({
    required this.rs,
    required this.desc,
    required this.planName,
    required this.lastUpdate,
  });

  factory DthBrowse_Plan.fromJson(Map<String, dynamic> json) => _$DthBrowse_PlanFromJson(json);
  Map<String, dynamic> toJson() => _$DthBrowse_PlanToJson(this);
}

@JsonSerializable()
class AddOnPack {
  @JsonKey(defaultValue: {})
  final Map<String, String> rs;
  final String desc;
  @JsonKey(name: 'plan_name')
  final String planName;
  @JsonKey(name: 'last_update')
  final String lastUpdate;

  AddOnPack({
    required this.rs,
    required this.desc,
    required this.planName,
    required this.lastUpdate,
  });

  factory AddOnPack.fromJson(Map<String, dynamic> json) => _$AddOnPackFromJson(json);
  Map<String, dynamic> toJson() => _$AddOnPackToJson(this);
}





// @JsonSerializable()
// class DthBrowseModelTransaction {
//   @JsonKey(name: 'statuscode')
//   final String statusCode;
//   final String status;
//   final DthBrowse_Data data;
//
//   DthBrowseModelTransaction({
//     required this.statusCode,
//     required this.status,
//     required this.data,
//   });
//
//   factory DthBrowseModelTransaction.fromJson(Map<String, dynamic> json) => _$DthBrowseModelTransactionFromJson(json);
//   Map<String, dynamic> toJson() => _$DthBrowseModelTransactionToJson(this);
// }
//
// @JsonSerializable()
// class DthBrowse_Data {
//   final DthBrowse_Records records;
//   final int status;
//
//   DthBrowse_Data({
//     required this.records,
//     required this.status,
//   });
//
//   factory DthBrowse_Data.fromJson(Map<String, dynamic> json) => _$DthBrowse_DataFromJson(json);
//   Map<String, dynamic> toJson() => _$DthBrowse_DataToJson(this);
// }
//
// @JsonSerializable()
// class DthBrowse_Records {
//   @JsonKey(name: 'Plan')
//   final List<DthBrowse_Plan> plan;
//   @JsonKey(name: 'Add-On Pack')
//   final List<AddOnPack> addOnPack;
//
//   DthBrowse_Records({
//     required this.plan,
//     required this.addOnPack,
//   });
//
//   factory DthBrowse_Records.fromJson(Map<String, dynamic> json) => _$DthBrowse_RecordsFromJson(json);
//   Map<String, dynamic> toJson() => _$DthBrowse_RecordsToJson(this);
// }
//
// @JsonSerializable()
// class DthBrowse_Plan {
//   final Map<String, String> rs;
//   final String desc;
//   @JsonKey(name: 'plan_name')
//   final String planName;
//   @JsonKey(name: 'last_update')
//   final String lastUpdate;
//
//   DthBrowse_Plan({
//     required this.rs,
//     required this.desc,
//     required this.planName,
//     required this.lastUpdate,
//   });
//
//   factory DthBrowse_Plan.fromJson(Map<String, dynamic> json) => _$DthBrowse_PlanFromJson(json);
//   Map<String, dynamic> toJson() => _$DthBrowse_PlanToJson(this);
// }
//
// @JsonSerializable()
// class AddOnPack {
//   final Map<String, String> rs;
//   final String desc;
//   @JsonKey(name: 'plan_name')
//   final String planName;
//   @JsonKey(name: 'last_update')
//   final String lastUpdate;
//
//   AddOnPack({
//     required this.rs,
//     required this.desc,
//     required this.planName,
//     required this.lastUpdate,
//   });
//
//   factory AddOnPack.fromJson(Map<String, dynamic> json) => _$AddOnPackFromJson(json);
//   Map<String, dynamic> toJson() => _$AddOnPackToJson(this);
// }