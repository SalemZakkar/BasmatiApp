import 'dart:convert';

/// totalRecords : 3
/// data : [{"id":"000000030000000000000002","name":"كشف","description":"Molestiae sed quas pariatur quisquam voluptatem fuga vel consectetur possimus.","fullPrice":300,"price":50,"isActive":false,"isSpecial":false,"image":"000000010000000300000005"},{"id":"000000030000000000000001","warranty":{"value":1,"unit":"month"},"name":"تقويم أسنان","description":"Molestiae sed quas pariatur quisquam voluptatem fuga vel consectetur possimus.","fullPrice":1200,"price":1000,"isActive":true,"isSpecial":false,"image":"000000010000000300000003"},{"id":"000000030000000000000000","warranty":{"value":1,"unit":"month"},"name":"ابتسامة هولود","description":"Totam quod reprehenderit voluptatibus illo velit qui.","fullPrice":1000,"price":800,"isActive":true,"isSpecial":false,"image":"000000010000000300000000"}]

ProductByCriteria productByCriteriaFromJson(String str) =>
    ProductByCriteria.fromJson(json.decode(str));

String productByCriteriaToJson(ProductByCriteria data) =>
    json.encode(data.toJson());

class ProductByCriteria {
  ProductByCriteria({
    num? totalRecords,
    List<ProductMainInfo>? data,
  }) {
    _totalRecords = totalRecords;
    _data = data;
  }

  ProductByCriteria.fromJson(dynamic json) {
    _totalRecords = json['totalRecords'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ProductMainInfo.fromJson(v));
      });
    }
  }

  num? _totalRecords;
  List<ProductMainInfo>? _data;

  ProductByCriteria copyWith({
    num? totalRecords,
    List<ProductMainInfo>? data,
  }) =>
      ProductByCriteria(
        totalRecords: totalRecords ?? _totalRecords,
        data: data ?? _data,
      );

  num? get totalRecords => _totalRecords;

  List<ProductMainInfo>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['totalRecords'] = _totalRecords;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : "000000030000000000000002"
/// name : "كشف"
/// description : "Molestiae sed quas pariatur quisquam voluptatem fuga vel consectetur possimus."
/// fullPrice : 300
/// price : 50
/// isActive : false
/// isSpecial : false
/// image : "000000010000000300000005"

ProductMainInfo dataFromJson(String str) =>
    ProductMainInfo.fromJson(json.decode(str));

String dataToJson(ProductMainInfo data) => json.encode(data.toJson());

class ProductMainInfo {
  ProductMainInfo({
    String? id,
    String? name,
    String? description,
    num? fullPrice,
    num? price,
    bool? isActive,
    bool? isSpecial,
    String? image,
  }) {
    _id = id;
    _name = name;
    _description = description;
    _fullPrice = fullPrice;
    _price = price;
    _isActive = isActive;
    _isSpecial = isSpecial;
    _image = image;
  }

  ProductMainInfo.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _fullPrice = json['fullPrice'];
    _price = json['price'];
    _isActive = json['isActive'];
    _isSpecial = json['isSpecial'];
    _image = json['image'];
  }

  String? _id;
  String? _name;
  String? _description;
  num? _fullPrice;
  num? _price;
  bool? _isActive;
  bool? _isSpecial;
  String? _image;

  ProductMainInfo copyWith({
    String? id,
    String? name,
    String? description,
    num? fullPrice,
    num? price,
    bool? isActive,
    bool? isSpecial,
    String? image,
  }) =>
      ProductMainInfo(
        id: id ?? _id,
        name: name ?? _name,
        description: description ?? _description,
        fullPrice: fullPrice ?? _fullPrice,
        price: price ?? _price,
        isActive: isActive ?? _isActive,
        isSpecial: isSpecial ?? _isSpecial,
        image: image ?? _image,
      );

  String? get id => _id;

  String? get name => _name;

  String? get description => _description;

  num? get fullPrice => _fullPrice;

  num? get price => _price;

  bool? get isActive => _isActive;

  bool? get isSpecial => _isSpecial;

  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['fullPrice'] = _fullPrice;
    map['price'] = _price;
    map['isActive'] = _isActive;
    map['isSpecial'] = _isSpecial;
    map['image'] = _image;
    return map;
  }
}
