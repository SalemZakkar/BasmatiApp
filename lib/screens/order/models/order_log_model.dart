/// totalRecords : 52
/// data : [{"id":"63404efed5ea0d23b2d0bd09","totalPrice":1000,"createdAt":"2022-10-07T16:08:35.281Z","productsCount":1,"status":{"at":"2022-10-07T16:08:30.089Z","status":"Pending payment"}},{"id":"633d658dd5ea0d23b2d0b47a","totalPrice":1000,"createdAt":"2022-10-05T11:08:02.806Z","productsCount":1,"status":{"at":"2022-10-05T11:07:57.689Z","status":"Pending payment"}},{"id":"633d6462d5ea0d23b2d0b467","totalPrice":6000,"createdAt":"2022-10-05T11:03:03.517Z","productsCount":1,"status":{"at":"2022-10-05T11:02:58.405Z","status":"Pending payment"}},{"id":"633d61b7d5ea0d23b2d0b431","totalPrice":17000,"createdAt":"2022-10-05T10:51:40.417Z","productsCount":2,"status":{"at":"2022-10-05T10:51:35.303Z","status":"Pending payment"}},{"id":"633d618fd5ea0d23b2d0b41c","totalPrice":17000,"createdAt":"2022-10-05T10:51:00.605Z","productsCount":2,"status":{"at":"2022-10-05T10:50:55.453Z","status":"Pending payment"}},{"id":"633d6134d5ea0d23b2d0b416","totalPrice":17000,"createdAt":"2022-10-05T10:49:29.699Z","productsCount":2,"status":{"at":"2022-10-05T10:49:24.596Z","status":"Pending payment"}},{"id":"633d6134d5ea0d23b2d0b412","totalPrice":17000,"createdAt":"2022-10-05T10:49:29.681Z","productsCount":2,"status":{"at":"2022-10-05T10:49:24.577Z","status":"Pending payment"}},{"id":"633d612ed5ea0d23b2d0b40d","totalPrice":17000,"createdAt":"2022-10-05T10:49:23.375Z","productsCount":2,"status":{"at":"2022-10-05T10:49:18.245Z","status":"Pending payment"}},{"id":"633d6110d5ea0d23b2d0b408","totalPrice":17000,"createdAt":"2022-10-05T10:48:54.050Z","productsCount":2,"status":{"at":"2022-10-05T10:48:48.873Z","status":"Pending payment"}},{"id":"633d6102d5ea0d23b2d0b403","totalPrice":17000,"createdAt":"2022-10-05T10:48:39.367Z","productsCount":2,"status":{"at":"2022-10-05T10:48:34.260Z","status":"Pending payment"}}]

class OrderLogModel {
  OrderLogModel({
    num? totalRecords,
    List<OrderLogData>? data,
  }) {
    _totalRecords = totalRecords;
    _data = data;
  }

  OrderLogModel.fromJson(dynamic json) {
    _totalRecords = json['totalRecords'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(OrderLogData.fromJson(v));
      });
    }
  }
  num? _totalRecords;
  List<OrderLogData>? _data;
  OrderLogModel copyWith({
    num? totalRecords,
    List<OrderLogData>? data,
  }) =>
      OrderLogModel(
        totalRecords: totalRecords ?? _totalRecords,
        data: data ?? _data,
      );
  num? get totalRecords => _totalRecords;
  List<OrderLogData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['totalRecords'] = _totalRecords;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : "63404efed5ea0d23b2d0bd09"
/// totalPrice : 1000
/// createdAt : "2022-10-07T16:08:35.281Z"
/// productsCount : 1
/// status : {"at":"2022-10-07T16:08:30.089Z","status":"Pending payment"}

class OrderLogData {
  OrderLogData({
    String? id,
    num? totalPrice,
    String? createdAt,
    num? productsCount,
    Status? status,
  }) {
    _id = id;
    _totalPrice = totalPrice;
    _createdAt = createdAt;
    _productsCount = productsCount;
    _status = status;
  }

  OrderLogData.fromJson(dynamic json) {
    _id = json['id'];
    _totalPrice = json['totalPrice'];
    _createdAt = json['createdAt'];
    _productsCount = json['productsCount'];
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
  }
  String? _id;
  num? _totalPrice;
  String? _createdAt;
  num? _productsCount;
  Status? _status;
  OrderLogData copyWith({
    String? id,
    num? totalPrice,
    String? createdAt,
    num? productsCount,
    Status? status,
  }) =>
      OrderLogData(
        id: id ?? _id,
        totalPrice: totalPrice ?? _totalPrice,
        createdAt: createdAt ?? _createdAt,
        productsCount: productsCount ?? _productsCount,
        status: status ?? _status,
      );
  String? get id => _id;
  num? get totalPrice => _totalPrice;
  String? get createdAt => _createdAt;
  num? get productsCount => _productsCount;
  Status? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['totalPrice'] = _totalPrice;
    map['createdAt'] = _createdAt;
    map['productsCount'] = _productsCount;
    if (_status != null) {
      map['status'] = _status?.toJson();
    }
    return map;
  }
}

/// at : "2022-10-07T16:08:30.089Z"
/// status : "Pending payment"

class Status {
  Status({
    String? at,
    String? status,
  }) {
    _at = at;
    _status = status;
  }

  Status.fromJson(dynamic json) {
    _at = json['at'];
    _status = json['status'];
  }
  String? _at;
  String? _status;
  Status copyWith({
    String? at,
    String? status,
  }) =>
      Status(
        at: at ?? _at,
        status: status ?? _status,
      );
  String? get at => _at;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['at'] = _at;
    map['status'] = _status;
    return map;
  }
}
