import 'dart:convert';

class fullTTmodel {
  final String statuscode;
  final String status;
  final fullTTmodel_data data;

  fullTTmodel({
    required this.statuscode,
    required this.status,
    required this.data,
  });

  factory fullTTmodel.fromJson(Map<String, dynamic> json) {
    var dataField = json['data'];
    if (dataField is String) {
      dataField = jsonDecode(dataField);
    }
    return fullTTmodel(
      statuscode: json['statuscode'],
      status: json['status'],
      data: fullTTmodel_data.fromJson(dataField),
     // data: fullTTmodel_data.fromJson(jsonDecode(json['data'])),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statuscode': statuscode,
      'status': status,
       'data': data.toJson(),

      // 'data': jsonEncode(data.toJson()),
    };
  }
}

class fullTTmodel_data {
  final Records records;
  final int status;
  final double time;

  fullTTmodel_data({
    required this.records,
    required this.status,
    required this.time,
  });

  factory fullTTmodel_data.fromJson(Map<String, dynamic> json) {
    return fullTTmodel_data(
      records: Records.fromJson(json['records']),
      status: json['status'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'records': records.toJson(),
      'status': status,
      'time': time,
    };
  }
}

class Records {
  final List<Plan> fullTT;
  final List<Plan> topUp;
  final List<Plan> threeGFourG;
  final List<Plan> twoG;
  final List<Plan> roaming;
  final List<Plan> comboOffers;  // Add this line


  Records({
    required this.fullTT,
    required this.topUp,
    required this.threeGFourG,
    required this.twoG,
    required this.roaming,
    required this.comboOffers,  // Add this line

  });

  factory Records.fromJson(Map<String, dynamic> json) {
    return Records(
      fullTT:json['FULLTT'] != null  ? List<Plan>.from(json['FULLTT'].map((x) => Plan.fromJson(x))) : [],
      topUp: json['TOPUP'] != null  ? List<Plan>.from(json['TOPUP'].map((x) => Plan.fromJson(x))) : [],
      threeGFourG: json['3G/4G'] != null  ? List<Plan>.from(json['3G/4G'].map((x) => Plan.fromJson(x))) : [],
      twoG: json['2G'] != null  ?  List<Plan>.from(json['2G'].map((x) => Plan.fromJson(x))) : [],
      roaming:  json['Roaming'] != null  ? List<Plan>.from(json['Romaing'].map((x) => Plan.fromJson(x))) : [],
      comboOffers: json['ComboOffers'] != null  ?  List<Plan>.from(json['ComboOffers'].map((x) => Plan.fromJson(x))) : [],  // Add this line

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'FULLTT': List<dynamic>.from(fullTT.map((x) => x.toJson())),
      'TOPUP': List<dynamic>.from(topUp.map((x) => x.toJson())),
      '3G/4G': List<dynamic>.from(threeGFourG.map((x) => x.toJson())),
      '2G': List<dynamic>.from(twoG.map((x) => x.toJson())),
      'Romaing': List<dynamic>.from(roaming.map((x) => x.toJson())),
      'ComboOffers': List<dynamic>.from(comboOffers.map((x) => x.toJson())),  // Add this line

    };
  }
}

class Plan {
  final String rs;
  final String desc;
  final String validity;
  final String lastUpdate;

  Plan({
    required this.rs,
    required this.desc,
    required this.validity,
    required this.lastUpdate,
  });

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      rs: json['rs'],
      desc: json['desc'],
      validity: json['validity'],
      lastUpdate: json['last_update'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rs': rs,
      'desc': desc,
      'validity': validity,
      'last_update': lastUpdate,
    };
  }
}