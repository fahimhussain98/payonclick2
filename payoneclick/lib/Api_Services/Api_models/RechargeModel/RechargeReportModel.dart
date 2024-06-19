
class RechargeReportsModel {
  String? statuscode;
  String? status;
  List<DataRechargeReport>? data;

  RechargeReportsModel({this.statuscode, this.status, this.data});

  RechargeReportsModel.fromJson(Map<String, dynamic> json) {
    statuscode = json['statuscode'];
    status = json['status'];
    if (json['data'] != null) {
      data = <DataRechargeReport>[];
      json['data'].forEach((v) {
        data!.add(DataRechargeReport.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statuscode'] = this.statuscode;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataRechargeReport {
  num? iD;
  num? userID;
  String? number;
  String? sType;
  num? apiID;
  String? apiName;
  Null? stateName;
  num? operatorID;
  num? serviceID;
  num? schemeID;
  num? commissionID;
  num? amount;
  double? commission;
  num? tDS;
  double? payableAmount;
  double? openingBalance;
  double? closingBalance;
  String? uniqueID;
  String? txnID;
  String? liveID;
  String? sTATUS;
  String? request;
  String? response;
  String? txnDate;
  String? payMode;
  String? userName;
  String? ownerName;
  String? userType;
  String? operatorName;
  String? oPImage;

  DataRechargeReport({
    this.iD,
    this.userID,
    this.number,
    this.sType,
    this.apiID,
    this.apiName,
    this.stateName,
    this.operatorID,
    this.serviceID,
    this.schemeID,
    this.commissionID,
    this.amount,
    this.commission,
    this.tDS,
    this.payableAmount,
    this.openingBalance,
    this.closingBalance,
    this.uniqueID,
    this.txnID,
    this.liveID,
    this.sTATUS,
    this.request,
    this.response,
    this.txnDate,
    this.payMode,
    this.userName,
    this.ownerName,
    this.userType,
    this.operatorName,
    this.oPImage,
  });

  DataRechargeReport.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    userID = json['UserID'];
    number = json['Number'];
    sType = json['SType'];
    apiID = json['ApiID'];
    apiName = json['ApiName'];
    stateName = json['StateName'];
    operatorID = json['OperatorID'];
    serviceID = json['ServiceID'];
    schemeID = json['SchemeID'];
    commissionID = json['CommissionID'];
    amount = json['Amount'];
    commission = json['Commission'];
    tDS = json['TDS'];
    payableAmount = json['PayableAmount'];
    openingBalance = json['OpeningBalance'];
    closingBalance = json['ClosingBalance'];
    uniqueID = json['UniqueID'];
    txnID = json['TxnID'];
    liveID = json['LiveID'];
    sTATUS = json['STATUS'];
    request = json['Request'];
    response = json['Response'];
    txnDate = json['TxnDate'];
    payMode = json['PayMode'];
    userName = json['UserName'];
    ownerName = json['OwnerName'];
    userType = json['UserType'];
    operatorName = json['OperatorName'];
    oPImage = json['OPImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['UserID'] = this.userID;
    data['Number'] = this.number;
    data['SType'] = this.sType;
    data['ApiID'] = this.apiID;
    data['ApiName'] = this.apiName;
    data['StateName'] = this.stateName;
    data['OperatorID'] = this.operatorID;
    data['ServiceID'] = this.serviceID;
    data['SchemeID'] = this.schemeID;
    data['CommissionID'] = this.commissionID;
    data['Amount'] = this.amount;
    data['Commission'] = this.commission;
    data['TDS'] = this.tDS;
    data['PayableAmount'] = this.payableAmount;
    data['OpeningBalance'] = this.openingBalance;
    data['ClosingBalance'] = this.closingBalance;
    data['UniqueID'] = this.uniqueID;
    data['TxnID'] = this.txnID;
    data['LiveID'] = this.liveID;
    data['STATUS'] = this.sTATUS;
    data['Request'] = this.request;
    data['Response'] = this.response;
    data['TxnDate'] = this.txnDate;
    data['PayMode'] = this.payMode;
    data['UserName'] = this.userName;
    data['OwnerName'] = this.ownerName;
    data['UserType'] = this.userType;
    data['OperatorName'] = this.operatorName;
    data['OPImage'] = this.oPImage;
    return data;
  }
}
