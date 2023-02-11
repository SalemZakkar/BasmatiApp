/// totalRecords : 1
/// data : [{"id":"6335b9c7d5ea0d23b2d09c73","totalPrice":400,"subscription":{"id":"000000040000000000000000","name":"jjjjjjj","price":400},"createdAt":"2022-09-29T15:29:11.554Z","status":{"status":"Done","at":"2022-09-29T15:29:11.553Z"}}]

class SubscribeLogModel {
  SubscribeLogModel({
    num? totalRecords,
    List<SubscribeLogData>? data,
  }) {
    _totalRecords = totalRecords;
    _data = data;
  }

  SubscribeLogModel.fromJson(dynamic json) {
    _totalRecords = json['totalRecords'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(SubscribeLogData.fromJson(v));
      });
    }
  }
  num? _totalRecords;
  List<SubscribeLogData>? _data;
  SubscribeLogModel copyWith({
    num? totalRecords,
    List<SubscribeLogData>? data,
  }) =>
      SubscribeLogModel(
        totalRecords: totalRecords ?? _totalRecords,
        data: data ?? _data,
      );
  num? get totalRecords => _totalRecords;
  List<SubscribeLogData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['totalRecords'] = _totalRecords;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : "6335b9c7d5ea0d23b2d09c73"
/// totalPrice : 400
/// subscription : {"id":"000000040000000000000000","name":"jjjjjjj","price":400}
/// createdAt : "2022-09-29T15:29:11.554Z"
/// status : {"status":"Done","at":"2022-09-29T15:29:11.553Z"}

class SubscribeLogData {
  SubscribeLogData({
    String? id,
    num? totalPrice,
    Subscription? subscription,
    String? createdAt,
    Status? status,
  }) {
    _id = id;
    _totalPrice = totalPrice;
    _subscription = subscription;
    _createdAt = createdAt;
    _status = status;
  }

  SubscribeLogData.fromJson(dynamic json) {
    _id = json['id'];
    _totalPrice = json['totalPrice'];
    _subscription = json['subscription'] != null
        ? Subscription.fromJson(json['subscription'])
        : null;
    _createdAt = json['createdAt'];
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
  }
  String? _id;
  num? _totalPrice;
  Subscription? _subscription;
  String? _createdAt;
  Status? _status;
  SubscribeLogData copyWith({
    String? id,
    num? totalPrice,
    Subscription? subscription,
    String? createdAt,
    Status? status,
  }) =>
      SubscribeLogData(
        id: id ?? _id,
        totalPrice: totalPrice ?? _totalPrice,
        subscription: subscription ?? _subscription,
        createdAt: createdAt ?? _createdAt,
        status: status ?? _status,
      );
  String? get id => _id;
  num? get totalPrice => _totalPrice;
  Subscription? get subscription => _subscription;
  String? get createdAt => _createdAt;
  Status? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['totalPrice'] = _totalPrice;
    if (_subscription != null) {
      map['subscription'] = _subscription?.toJson();
    }
    map['createdAt'] = _createdAt;
    if (_status != null) {
      map['status'] = _status?.toJson();
    }
    return map;
  }
}

/// status : "Done"
/// at : "2022-09-29T15:29:11.553Z"

class Status {
  Status({
    String? status,
    String? at,
  }) {
    _status = status;
    _at = at;
  }

  Status.fromJson(dynamic json) {
    _status = json['status'];
    _at = json['at'];
  }
  String? _status;
  String? _at;
  Status copyWith({
    String? status,
    String? at,
  }) =>
      Status(
        status: status ?? _status,
        at: at ?? _at,
      );
  String? get status => _status;
  String? get at => _at;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['at'] = _at;
    return map;
  }
}

/// id : "000000040000000000000000"
/// name : "jjjjjjj"
/// price : 400

class Subscription {
  Subscription({
    String? id,
    String? name,
    num? price,
  }) {
    _id = id;
    _name = name;
    _price = price;
  }

  Subscription.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _price = json['price'];
  }
  String? _id;
  String? _name;
  num? _price;
  Subscription copyWith({
    String? id,
    String? name,
    num? price,
  }) =>
      Subscription(
        id: id ?? _id,
        name: name ?? _name,
        price: price ?? _price,
      );
  String? get id => _id;
  String? get name => _name;
  num? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['price'] = _price;
    return map;
  }
}
