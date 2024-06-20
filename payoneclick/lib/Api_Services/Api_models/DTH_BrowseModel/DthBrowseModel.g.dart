// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DthBrowseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DthBrowseModelTransaction _$DthBrowseModelTransactionFromJson(
        Map<String, dynamic> json) =>
    DthBrowseModelTransaction(
      statusCode: json['statuscode'] as String,
      status: json['status'] as String,
      data: DthBrowse_Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DthBrowseModelTransactionToJson(
        DthBrowseModelTransaction instance) =>
    <String, dynamic>{
      'statuscode': instance.statusCode,
      'status': instance.status,
      'data': instance.data,
    };

DthBrowse_Data _$DthBrowse_DataFromJson(Map<String, dynamic> json) =>
    DthBrowse_Data(
      records:
          DthBrowse_Records.fromJson(json['records'] as Map<String, dynamic>),
      status: (json['status'] as num).toInt(),
    );

Map<String, dynamic> _$DthBrowse_DataToJson(DthBrowse_Data instance) =>
    <String, dynamic>{
      'records': instance.records,
      'status': instance.status,
    };

DthBrowse_Records _$DthBrowse_RecordsFromJson(Map<String, dynamic> json) =>
    DthBrowse_Records(
      plan: (json['Plan'] as List<dynamic>?)
              ?.map((e) => DthBrowse_Plan.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      addOnPack: (json['Add-On Pack'] as List<dynamic>?)
              ?.map((e) => AddOnPack.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$DthBrowse_RecordsToJson(DthBrowse_Records instance) =>
    <String, dynamic>{
      'Plan': instance.plan,
      'Add-On Pack': instance.addOnPack,
    };

DthBrowse_Plan _$DthBrowse_PlanFromJson(Map<String, dynamic> json) =>
    DthBrowse_Plan(
      rs: (json['rs'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          {},
      desc: json['desc'] as String,
      planName: json['plan_name'] as String,
      lastUpdate: json['last_update'] as String,
    );

Map<String, dynamic> _$DthBrowse_PlanToJson(DthBrowse_Plan instance) =>
    <String, dynamic>{
      'rs': instance.rs,
      'desc': instance.desc,
      'plan_name': instance.planName,
      'last_update': instance.lastUpdate,
    };

AddOnPack _$AddOnPackFromJson(Map<String, dynamic> json) => AddOnPack(
      rs: (json['rs'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          {},
      desc: json['desc'] as String,
      planName: json['plan_name'] as String,
      lastUpdate: json['last_update'] as String,
    );

Map<String, dynamic> _$AddOnPackToJson(AddOnPack instance) => <String, dynamic>{
      'rs': instance.rs,
      'desc': instance.desc,
      'plan_name': instance.planName,
      'last_update': instance.lastUpdate,
    };
