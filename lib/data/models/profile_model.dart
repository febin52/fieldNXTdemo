class ProfileModel {
  ProfileModel({
    this.id,
    this.token,
    this.tokenExpires,
    this.firstName,
    this.lastName,
    this.contactNo,
    this.empCode,
    this.role,
  });

  ProfileModel.fromJson(dynamic json) {
    id = json['id'];
    token = json['token'];
    tokenExpires = json['tokenExpires'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    contactNo = json['contactNo'];
    empCode = json['empCode'];
    role = json['role'];
  }
  String? id;
  String? token;
  String? tokenExpires;
  String? firstName;
  String? lastName;
  String? contactNo;
  String? empCode;
  String? role;

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

    return map;
  }
}
