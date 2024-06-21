// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BrowsePlanModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrowsePlanModel _$BrowsePlanModelFromJson(Map<String, dynamic> json) =>
    BrowsePlanModel(
      statuscode: json['statuscode'] as String,
      status: json['status'] as String,
      data: json['data'] == null
          ? null
          : InnerData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BrowsePlanModelToJson(BrowsePlanModel instance) =>
    <String, dynamic>{
      'statuscode': instance.statuscode,
      'status': instance.status,
      'data': instance.data,
    };

InnerData _$InnerDataFromJson(Map<String, dynamic> json) => InnerData(
      records: json['records'] == null
          ? null
          : Records.fromJson(json['records'] as Map<String, dynamic>),
      status: (json['status'] as num?)?.toInt(),
      time: (json['time'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$InnerDataToJson(InnerData instance) => <String, dynamic>{
      'records': instance.records,
      'status': instance.status,
      'time': instance.time,
    };

Records _$RecordsFromJson(Map<String, dynamic> json) => Records(
      topup: (json['TOPUP'] as List<dynamic>?)
          ?.map((e) => Plan.fromJson(e as Map<String, dynamic>))
          .toList(),
      threeGFourG: (json['3G/4G'] as List<dynamic>?)
          ?.map((e) => Plan.fromJson(e as Map<String, dynamic>))
          .toList(),
      romaing: (json['Romaing'] as List<dynamic>?)
          ?.map((e) => Plan.fromJson(e as Map<String, dynamic>))
          .toList(),
      combo: (json['COMBO'] as List<dynamic>?)
          ?.map((e) => Plan.fromJson(e as Map<String, dynamic>))
          .toList(),
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$RecordsToJson(Records instance) => <String, dynamic>{
      'TOPUP': instance.topup,
      '3G/4G': instance.threeGFourG,
      'Romaing': instance.romaing,
      'COMBO': instance.combo,
      'msg': instance.msg,
    };

Plan _$PlanFromJson(Map<String, dynamic> json) => Plan(
      rs: json['rs'] as String,
      desc: json['desc'] as String,
      validity: json['validity'] as String,
      lastUpdate: json['last_update'] as String,
    );

Map<String, dynamic> _$PlanToJson(Plan instance) => <String, dynamic>{
      'rs': instance.rs,
      'desc': instance.desc,
      'validity': instance.validity,
      'last_update': instance.lastUpdate,
    };
