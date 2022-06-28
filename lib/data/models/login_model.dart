class LoginModel {
  LoginModel({
      this.code, 
      this.message, 
      this.data,});

  LoginModel.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? code;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.token, 
      this.tokenExpires, 
      this.firstName, 
      this.lastName, 
      this.contactNo, 
      this.empCode, 
      this.role, 
      this.verticalArray,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    token = json['token'];
    tokenExpires = json['tokenExpires'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    contactNo = json['contactNo'];
    empCode = json['empCode'];
    role = json['role'];
    if (json['verticalArray'] != null) {
      verticalArray = [];
      json['verticalArray'].forEach((v) {
        verticalArray?.add(VerticalArray.fromJson(v));
      });
    }
  }
  String? id;
  String? token;
  String? tokenExpires;
  String? firstName;
  String? lastName;
  String? contactNo;
  String? empCode;
  String? role;
  List<VerticalArray>? verticalArray;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['token'] = token;
    map['tokenExpires'] = tokenExpires;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['contactNo'] = contactNo;
    map['empCode'] = empCode;
    map['role'] = role;
    if (verticalArray != null) {
      map['verticalArray'] = verticalArray?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class VerticalArray {
  VerticalArray({
      this.verticalId, 
      this.verticalName, 
      this.priceTypeId, 
      this.priceTypeName,});

  VerticalArray.fromJson(dynamic json) {
    verticalId = json['verticalId'];
    verticalName = json['verticalName'];
    priceTypeId = json['priceTypeId'];
    priceTypeName = json['priceTypeName'];
  }
  String? verticalId;
  String? verticalName;
  String? priceTypeId;
  String? priceTypeName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['verticalId'] = verticalId;
    map['verticalName'] = verticalName;
    map['priceTypeId'] = priceTypeId;
    map['priceTypeName'] = priceTypeName;
    return map;
  }

}