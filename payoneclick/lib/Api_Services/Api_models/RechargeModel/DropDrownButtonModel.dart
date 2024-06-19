class DropDrownButtonModel {
  String? _statuscode;
  String? _status;
  List<Data_DrownButtonModel>? _data;

  DropDrownButtonModel({String? statuscode, String? status, List<Data_DrownButtonModel>? data}) {
    if (statuscode != null) {
      this._statuscode = statuscode;
    }
    if (status != null) {
      this._status = status;
    }
    if (data != null) {
      this._data = data;
    }
  }

  String? get statuscode => _statuscode;
  set statuscode(String? statuscode) => _statuscode = statuscode;
  String? get status => _status;
  set status(String? status) => _status = status;
  List<Data_DrownButtonModel>? get data => _data;
  set data(List<Data_DrownButtonModel>? data) => _data = data;

  DropDrownButtonModel.fromJson(Map<String, dynamic> json) {
    _statuscode = json['statuscode'];
    _status = json['status'];
    if (json['data'] != null) {
      _data = <Data_DrownButtonModel>[];
      json['data'].forEach((v) {
        _data!.add(new Data_DrownButtonModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statuscode'] = this._statuscode;
    data['status'] = this._status;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
// lib/models/data.dart

class Data_DrownButtonModel {
  int? _iD;
  String? _operatorName;
  double? _minAmount;
  double? _maxAmount;
  int? _serviceID;
  String? _oPImage;
  String? _operatorCode;
  bool? _status;
  String? _createDate;
  String? _paramName;

  Data(
      {int? iD,
        String? operatorName,
        double? minAmount,
        double? maxAmount,
        int? serviceID,
        String? oPImage,
        String? operatorCode,
        bool? status,
        String? createDate,
        String? paramName}) {
    if (iD != null) {
      this._iD = iD;
    }
    if (operatorName != null) {
      this._operatorName = operatorName;
    }
    if (minAmount != null) {
      this._minAmount = minAmount;
    }
    if (maxAmount != null) {
      this._maxAmount = maxAmount;
    }
    if (serviceID != null) {
      this._serviceID = serviceID;
    }
    if (oPImage != null) {
      this._oPImage = oPImage;
    }
    if (operatorCode != null) {
      this._operatorCode = operatorCode;
    }
    if (status != null) {
      this._status = status;
    }
    if (createDate != null) {
      this._createDate = createDate;
    }
    if (paramName != null) {
      this._paramName = paramName;
    }
  }

  int? get iD => _iD;
  set iD(int? iD) => _iD = iD;
  String? get operatorName => _operatorName;
  set operatorName(String? operatorName) => _operatorName = operatorName;
  double? get minAmount => _minAmount;
  set minAmount(double? minAmount) => _minAmount = minAmount;
  double? get maxAmount => _maxAmount;
  set maxAmount(double? maxAmount) => _maxAmount = maxAmount;
  int? get serviceID => _serviceID;
  set serviceID(int? serviceID) => _serviceID = serviceID;
  String? get oPImage => _oPImage;
  set oPImage(String? oPImage) => _oPImage = oPImage;
  String? get operatorCode => _operatorCode;
  set operatorCode(String? operatorCode) => _operatorCode = operatorCode;
  bool? get status => _status;
  set status(bool? status) => _status = status;
  String? get createDate => _createDate;
  set createDate(String? createDate) => _createDate = createDate;
  String? get paramName => _paramName;
  set paramName(String? paramName) => _paramName = paramName;

  Data_DrownButtonModel.fromJson(Map<String, dynamic> json) {
    _iD = json['ID'];
    _operatorName = json['OperatorName'];
    _minAmount = (json['MinAmount'] as num?)?.toDouble();
    _maxAmount = (json['MaxAmount'] as num?)?.toDouble();
    _serviceID = json['ServiceID'];
    _oPImage = json['OPImage'];
    _operatorCode = json['OperatorCode'];
    _status = json['Status'];
    _createDate = json['CreateDate'];
    _paramName = json['paramName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this._iD;
    data['OperatorName'] = this._operatorName;
    data['MinAmount'] = this._minAmount;
    data['MaxAmount'] = this._maxAmount;
    data['ServiceID'] = this._serviceID;
    data['OPImage'] = this._oPImage;
    data['OperatorCode'] = this._operatorCode;
    data['Status'] = this._status;
    data['CreateDate'] = this._createDate;
    data['paramName'] = this._paramName;
    return data;
  }
}
