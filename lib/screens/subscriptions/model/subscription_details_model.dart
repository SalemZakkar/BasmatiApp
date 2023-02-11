/// data : {"id":"63388991d5ea0d23b2d0a138","duration":{"value":55,"unit":"day"},"name":"ggggggggggg","description":"gggggggggg55","price":88,"discount":77,"isActive":true,"createdAt":"2022-10-01T18:40:17.687Z","updatedAt":"2022-10-01T18:42:18.454Z"}

class SubscriptionDetailsModel {
  SubscriptionDetailsModel({
    SubscriptionDetailsData? data,
  }) {
    _data = data;
  }

  SubscriptionDetailsModel.fromJson(dynamic json) {
    _data = json['data'] != null
        ? SubscriptionDetailsData.fromJson(json['data'])
        : null;
  }
  SubscriptionDetailsData? _data;
  SubscriptionDetailsModel copyWith({
    SubscriptionDetailsData? data,
  }) =>
      SubscriptionDetailsModel(
        data: data ?? _data,
      );
  SubscriptionDetailsData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// id : "63388991d5ea0d23b2d0a138"
/// duration : {"value":55,"unit":"day"}
/// name : "ggggggggggg"
/// description : "gggggggggg55"
/// price : 88
/// discount : 77
/// isActive : true
/// createdAt : "2022-10-01T18:40:17.687Z"
/// updatedAt : "2022-10-01T18:42:18.454Z"

class SubscriptionDetailsData {
  SubscriptionDetailsData({
    String? id,
    Duration? duration,
    String? name,
    String? description,
    num? price,
    num? discount,
    bool? isActive,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _duration = duration;
    _name = name;
    _description = description;
    _price = price;
    _discount = discount;
    _isActive = isActive;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  SubscriptionDetailsData.fromJson(dynamic json) {
    _id = json['id'];
    _duration =
        json['duration'] != null ? Duration.fromJson(json['duration']) : null;
    _name = json['name'];
    _description = json['description'];
    _price = json['price'];
    _discount = json['discount'];
    _isActive = json['isActive'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  String? _id;
  Duration? _duration;
  String? _name;
  String? _description;
  num? _price;
  num? _discount;
  bool? _isActive;
  String? _createdAt;
  String? _updatedAt;
  SubscriptionDetailsData copyWith({
    String? id,
    Duration? duration,
    String? name,
    String? description,
    num? price,
    num? discount,
    bool? isActive,
    String? createdAt,
    String? updatedAt,
  }) =>
      SubscriptionDetailsData(
        id: id ?? _id,
        duration: duration ?? _duration,
        name: name ?? _name,
        description: description ?? _description,
        price: price ?? _price,
        discount: discount ?? _discount,
        isActive: isActive ?? _isActive,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  String? get id => _id;
  Duration? get duration => _duration;
  String? get name => _name;
  String? get description => _description;
  num? get price => _price;
  num? get discount => _discount;
  bool? get isActive => _isActive;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_duration != null) {
      map['duration'] = _duration?.toJson();
    }
    map['name'] = _name;
    map['description'] = _description;
    map['price'] = _price;
    map['discount'] = _discount;
    map['isActive'] = _isActive;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }
}

/// value : 55
/// unit : "day"

class Duration {
  Duration({
    num? value,
    String? unit,
  }) {
    _value = value;
    _unit = unit;
  }

  Duration.fromJson(dynamic json) {
    _value = json['value'];
    _unit = json['unit'];
  }
  num? _value;
  String? _unit;
  Duration copyWith({
    num? value,
    String? unit,
  }) =>
      Duration(
        value: value ?? _value,
        unit: unit ?? _unit,
      );
  num? get value => _value;
  String? get unit => _unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = _value;
    map['unit'] = _unit;
    return map;
  }
}
