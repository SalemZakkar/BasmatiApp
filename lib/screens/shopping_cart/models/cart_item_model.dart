import 'dart:convert';

/// data : {"type":"Online","discount":0,"subTotal":3000,"totalPrice":3000,"products":[{"id":"000000030000000000000000","name":"ابتسامة هولود","qty":3,"price":1000,"warranty":{"value":1,"unit":"month"}}]}

class CartItemModel {
  CartItemModel({
    CartItemData? data,
  }) {
    _data = data;
  }

  CartItemModel.fromJson(dynamic json) {
    _data = json['data'] != null ? CartItemData.fromJson(json['data']) : null;
  }
  CartItemData? _data;
  CartItemModel copyWith({
    CartItemData? data,
  }) =>
      CartItemModel(
        data: data ?? _data,
      );
  CartItemData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// type : "Online"
/// discount : 0
/// subTotal : 3000
/// totalPrice : 3000
/// products : [{"id":"000000030000000000000000","name":"ابتسامة هولود","qty":3,"price":1000,"warranty":{"value":1,"unit":"month"}}]

class CartItemData {
  CartItemData({
    String? type,
    num? discount,
    num? subTotal,
    num? totalPrice,
    List<Products>? products,
  }) {
    _type = type;
    _discount = discount;
    _subTotal = subTotal;
    _totalPrice = totalPrice;
    _products = products;
  }

  CartItemData.fromJson(dynamic json) {
    _type = json['type'];
    _discount = json['discount'];
    _subTotal = json['subTotal'];
    _totalPrice = json['totalPrice'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
  }
  String? _type;
  num? _discount;
  num? _subTotal;
  num? _totalPrice;
  List<Products>? _products;
  CartItemData copyWith({
    String? type,
    num? discount,
    num? subTotal,
    num? totalPrice,
    List<Products>? products,
  }) =>
      CartItemData(
        type: type ?? _type,
        discount: discount ?? _discount,
        subTotal: subTotal ?? _subTotal,
        totalPrice: totalPrice ?? _totalPrice,
        products: products ?? _products,
      );
  String? get type => _type;
  num? get discount => _discount;
  num? get subTotal => _subTotal;
  num? get totalPrice => _totalPrice;
  List<Products>? get products => _products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['discount'] = _discount;
    map['subTotal'] = _subTotal;
    map['totalPrice'] = _totalPrice;
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : "000000030000000000000000"
/// name : "ابتسامة هولود"
/// qty : 3
/// price : 1000
/// warranty : {"value":1,"unit":"month"}

class Products {
  Products({
    String? id,
    String? name,
    num? qty,
    num? price,
    WarrantyShopping? warranty,
  }) {
    _id = id;
    _name = name;
    _qty = qty;
    _price = price;
    _warranty = warranty;
  }

  Products.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _qty = json['qty'];
    _price = json['price'];
    _warranty = json['warranty'] != null
        ? WarrantyShopping.fromJson(json['warranty'])
        : null;
  }
  String? _id;
  String? _name;
  num? _qty;
  num? _price;
  WarrantyShopping? _warranty;
  Products copyWith({
    String? id,
    String? name,
    num? qty,
    num? price,
    WarrantyShopping? warranty,
  }) =>
      Products(
        id: id ?? _id,
        name: name ?? _name,
        qty: qty ?? _qty,
        price: price ?? _price,
        warranty: warranty ?? _warranty,
      );
  String? get id => _id;
  String? get name => _name;
  num? get qty => _qty;
  num? get price => _price;
  WarrantyShopping? get warranty => _warranty;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['qty'] = _qty;
    map['price'] = _price;
    if (_warranty != null) {
      map['warranty'] = _warranty?.toJson().toString();
    }
    return map;
  }

  Map<String, dynamic> toJsonDB() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['qty'] = _qty;
    map['price'] = _price;
    if (_warranty != null) {
      map['warranty'] = jsonEncode(_warranty?.toJson());
    }
    return map;
  }
}

/// value : 1
/// unit : "month"

class WarrantyShopping {
  WarrantyShopping({
    num? value,
    String? unit,
  }) {
    _value = value;
    _unit = unit;
  }

  WarrantyShopping.fromJson(dynamic json) {
    _value = json['value'];
    _unit = json['unit'];
  }
  num? _value;
  String? _unit;
  WarrantyShopping copyWith({
    num? value,
    String? unit,
  }) =>
      WarrantyShopping(
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

  String toStr() {
    return "{\"value\" : \"$_value\" , \"unit\" : \"month\"}";
  }
}
