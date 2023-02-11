import 'dart:convert';

/// data : {"accessToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjAwMDAwMDAyMDAwMDAwMDAwMDAwMDAwMCIsImlhdCI6MTY2MjM3Mzg2NywiZXhwIjoxNjY0MTAxODY3fQ.MRaNPekWNWd3K1ALqkkaHLPRAZuiC23fT-XQb0v5-jQ","refreshToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjAwMDAwMDAyMDAwMDAwMDAwMDAwMDAwMCIsImlhdCI6MTY2MjM2OTcwNH0.kwcnZnoOn_eOcdsa-V_Yeh7WANHxgVE8jqECV-A2QkA"}

SingInModel singInModelFromJson(String str) =>
    SingInModel.fromJson(json.decode(str));

String singInModelToJson(SingInModel data) => json.encode(data.toJson());

class SingInModel {
  SingInModel({
    Data? data,
  }) {
    _data = data;
  }

  SingInModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Data? _data;

  SingInModel copyWith({
    Data? data,
  }) =>
      SingInModel(
        data: data ?? _data,
      );

  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// accessToken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjAwMDAwMDAyMDAwMDAwMDAwMDAwMDAwMCIsImlhdCI6MTY2MjM3Mzg2NywiZXhwIjoxNjY0MTAxODY3fQ.MRaNPekWNWd3K1ALqkkaHLPRAZuiC23fT-XQb0v5-jQ"
/// refreshToken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjAwMDAwMDAyMDAwMDAwMDAwMDAwMDAwMCIsImlhdCI6MTY2MjM2OTcwNH0.kwcnZnoOn_eOcdsa-V_Yeh7WANHxgVE8jqECV-A2QkA"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? accessToken,
    String? refreshToken,
  }) {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
  }

  Data.fromJson(dynamic json) {
    _accessToken = json['accessToken'];
    _refreshToken = json['refreshToken'];
  }

  String? _accessToken;
  String? _refreshToken;

  Data copyWith({
    String? accessToken,
    String? refreshToken,
  }) =>
      Data(
        accessToken: accessToken ?? _accessToken,
        refreshToken: refreshToken ?? _refreshToken,
      );

  String? get accessToken => _accessToken;

  String? get refreshToken => _refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accessToken'] = _accessToken;
    map['refreshToken'] = _refreshToken;
    return map;
  }
}
