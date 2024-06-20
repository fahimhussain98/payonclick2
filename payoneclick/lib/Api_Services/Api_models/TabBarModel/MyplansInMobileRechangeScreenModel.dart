import 'dart:convert';

class MyPlanModelRS {
  String statuscode;
  String status;
  MyPlanModelRS_data data;

  MyPlanModelRS({
    required this.statuscode,
    required this.status,
    required this.data,
  });

  factory MyPlanModelRS.fromJson(Map<String, dynamic> json) {
    return MyPlanModelRS(
      statuscode: json['statuscode'],
      status: json['status'],
      // data: MyPlanModelRS_data.fromJson(jsonDecode(json['data'])),
      data:MyPlanModelRS_data.fromJson(json['data']),
    );
  }
}

class MyPlanModelRS_data {
  String tel;
  String operator;
  List<Record> records;
  int status;
  double time;

  MyPlanModelRS_data({
    required this.tel,
    required this.operator,
    required this.records,
    required this.status,
    required this.time,
  });

  factory MyPlanModelRS_data.fromJson(Map<String, dynamic> json) {
    return MyPlanModelRS_data(
      tel: json['tel'],
      operator: json['operator'],
      // records: List<Record>.from(json['records'].map((record) => Record.fromJson(record))),
      records: json['records'] != null
          ? List<Record>.from(json['records'].map((record) => Record.fromJson(record)))
          : [],
      status: json['status'],
      time: json['time'].toDouble(),
    );
  }
}

class Record {
  String rs;
  String desc;

  Record({
    required this.rs,
    required this.desc,
  });

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      // rs: json['rs'],
      rs: json['rs'].toString(),  // Convert to String if needed
      desc: json['desc'],
    );
  }
}