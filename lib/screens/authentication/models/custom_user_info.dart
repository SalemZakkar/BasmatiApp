import 'dart:convert';

/// firstName : ""
/// lastName : ""
/// fullName : ""
/// userName : ""
/// phoneNumber : ""
/// email : ""
/// city : ""
/// password : ""

CustomUserInfo customUserInfoFromJson(String str) =>
    CustomUserInfo.fromJson(json.decode(str));

String customUserInfoToJson(CustomUserInfo data) => json.encode(data.toJson());

class CustomUserInfo {
  CustomUserInfo({
    String? firstName,
    String? lastName,
    String? fullName,
    String? userName,
    String? phoneNumber,
    String? email,
    String? city,
    String? password,
  }) {
    _firstName = firstName;
    _lastName = lastName;
    _fullName = fullName;
    _userName = userName;
    _phoneNumber = phoneNumber;
    _email = email;
    _city = city;
    _password = password;
  }

  CustomUserInfo.fromJson(dynamic json) {
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _fullName = json['fullName'];
    _userName = json['userName'];
    _phoneNumber = json['phoneNumber'];
    _email = json['email'];
    _city = json['city'];
    _password = json['password'];
  }

  String? _firstName;
  String? _lastName;
  String? _fullName;
  String? _userName;
  String? _phoneNumber;
  String? _email;
  String? _city;
  String? _password;

  CustomUserInfo copyWith({
    String? firstName,
    String? lastName,
    String? fullName,
    String? userName,
    String? phoneNumber,
    String? email,
    String? city,
    String? password,
  }) =>
      CustomUserInfo(
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        fullName: fullName ?? _fullName,
        userName: userName ?? _userName,
        phoneNumber: phoneNumber ?? _phoneNumber,
        email: email ?? _email,
        city: city ?? _city,
        password: password ?? _password,
      );

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get fullName => _fullName;

  String? get userName => _userName;

  String? get phoneNumber => _phoneNumber;

  String? get email => _email;

  String? get city => _city;

  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['fullName'] = _fullName;
    map['userName'] = _userName;
    map['phoneNumber'] = _phoneNumber;
    map['email'] = _email;
    map['city'] = _city;
    map['password'] = _password;
    return map;
  }
}
