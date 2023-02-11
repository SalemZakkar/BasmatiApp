/// data : {"id":"000000030000000000000000","warranty":{"value":1,"unit":"month"},"name":"ابتسامة هولود","description":"Totam quod reprehenderit voluptatibus illo velit qui.","fullPrice":1000,"price":800,"isActive":true,"isSpecial":false,"images":["000000010000000300000000","000000010000000300000001","000000010000000300000002"],"createdAt":"2022-09-13T20:15:33.529Z","updatedAt":"2022-09-13T20:15:33.529Z"}

class ProductDetails {
  ProductDetails({
    ProductInfo? data,
  }) {
    _data = data;
  }

  ProductDetails.fromJson(dynamic json) {
    _data = json['data'] != null ? ProductInfo.fromJson(json['data']) : null;
  }
  ProductInfo? _data;
  ProductDetails copyWith({
    ProductInfo? data,
  }) =>
      ProductDetails(
        data: data ?? _data,
      );
  ProductInfo? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// id : "000000030000000000000000"
/// warranty : {"value":1,"unit":"month"}
/// name : "ابتسامة هولود"
/// description : "Totam quod reprehenderit voluptatibus illo velit qui."
/// fullPrice : 1000
/// price : 800
/// isActive : true
/// isSpecial : false
/// images : ["000000010000000300000000","000000010000000300000001","000000010000000300000002"]
/// createdAt : "2022-09-13T20:15:33.529Z"
/// updatedAt : "2022-09-13T20:15:33.529Z"

class ProductInfo {
  ProductInfo({
    String? id,
    Warranty? warranty,
    String? name,
    String? description,
    num? fullPrice,
    num? price,
    bool? isActive,
    bool? isSpecial,
    List<String>? images,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _warranty = warranty;
    _name = name;
    _description = description;
    _fullPrice = fullPrice;
    _price = price;
    _isActive = isActive;
    _isSpecial = isSpecial;
    _images = images;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  ProductInfo.fromJson(dynamic json) {
    _id = json['id'];
    _warranty =
        json['warranty'] != null ? Warranty.fromJson(json['warranty']) : null;
    _name = json['name'];
    _description = json['description'];
    _fullPrice = json['fullPrice'];
    _price = json['price'];
    _isActive = json['isActive'];
    _isSpecial = json['isSpecial'];
    _images = json['images'] != null ? json['images'].cast<String>() : [];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  String? _id;
  Warranty? _warranty;
  String? _name;
  String? _description;
  num? _fullPrice;
  num? _price;
  bool? _isActive;
  bool? _isSpecial;
  List<String>? _images;
  String? _createdAt;
  String? _updatedAt;
  ProductInfo copyWith({
    String? id,
    Warranty? warranty,
    String? name,
    String? description,
    num? fullPrice,
    num? price,
    bool? isActive,
    bool? isSpecial,
    List<String>? images,
    String? createdAt,
    String? updatedAt,
  }) =>
      ProductInfo(
        id: id ?? _id,
        warranty: warranty ?? _warranty,
        name: name ?? _name,
        description: description ?? _description,
        fullPrice: fullPrice ?? _fullPrice,
        price: price ?? _price,
        isActive: isActive ?? _isActive,
        isSpecial: isSpecial ?? _isSpecial,
        images: images ?? _images,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  String? get id => _id;
  Warranty? get warranty => _warranty;
  String? get name => _name;
  String? get description => _description;
  num? get fullPrice => _fullPrice;
  num? get price => _price;
  bool? get isActive => _isActive;
  bool? get isSpecial => _isSpecial;
  List<String>? get images => _images;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_warranty != null) {
      map['warranty'] = _warranty?.toJson();
    }
    map['name'] = _name;
    map['description'] = _description;
    map['fullPrice'] = _fullPrice;
    map['price'] = _price;
    map['isActive'] = _isActive;
    map['isSpecial'] = _isSpecial;
    map['images'] = _images;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }
}

/// value : 1
/// unit : "month"

class Warranty {
  Warranty({
    num? value,
    String? unit,
  }) {
    _value = value;
    _unit = unit;
  }

  Warranty.fromJson(dynamic json) {
    _value = json['value'];
    _unit = json['unit'];
  }
  num? _value;
  String? _unit;
  Warranty copyWith({
    num? value,
    String? unit,
  }) =>
      Warranty(
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
