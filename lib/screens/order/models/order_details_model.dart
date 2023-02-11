/// data : {"id":"633d618fd5ea0d23b2d0b41c","type":"Online","discount":0,"subTotal":17000,"totalPrice":17000,"products":[{"id":"633c3952d5ea0d23b2d0b02e","name":"Salad","qty":11,"price":1000,"warrantyExpiresAt":"2022-11-05T10:50:55.453Z"},{"id":"633c3954d5ea0d23b2d0b031","name":"Chips","qty":6,"price":1000,"warrantyExpiresAt":"2022-11-05T10:50:55.453Z"}],"statuses":[{"at":"2022-10-05T10:50:55.453Z","status":"Pending payment"}],"invoice":"https://checkout.moyasar.com/invoices/9c6269df-8cb6-4fa7-b38b-6a6bf1847bb2?lang=en","createdAt":"2022-10-05T10:51:00.605Z","updatedAt":"2022-10-05T10:51:00.605Z"}

class OrderDetailsModel {
  OrderDetailsModel({
    OrderDetailsData? data,
  }) {
    _data = data;
  }

  OrderDetailsModel.fromJson(dynamic json) {
    _data =
        json['data'] != null ? OrderDetailsData.fromJson(json['data']) : null;
  }
  OrderDetailsData? _data;
  OrderDetailsModel copyWith({
    OrderDetailsData? data,
  }) =>
      OrderDetailsModel(
        data: data ?? _data,
      );
  OrderDetailsData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// id : "633d618fd5ea0d23b2d0b41c"
/// type : "Online"
/// discount : 0
/// subTotal : 17000
/// totalPrice : 17000
/// products : [{"id":"633c3952d5ea0d23b2d0b02e","name":"Salad","qty":11,"price":1000,"warrantyExpiresAt":"2022-11-05T10:50:55.453Z"},{"id":"633c3954d5ea0d23b2d0b031","name":"Chips","qty":6,"price":1000,"warrantyExpiresAt":"2022-11-05T10:50:55.453Z"}]
/// statuses : [{"at":"2022-10-05T10:50:55.453Z","status":"Pending payment"}]
/// invoice : "https://checkout.moyasar.com/invoices/9c6269df-8cb6-4fa7-b38b-6a6bf1847bb2?lang=en"
/// createdAt : "2022-10-05T10:51:00.605Z"
/// updatedAt : "2022-10-05T10:51:00.605Z"

class OrderDetailsData {
  OrderDetailsData({
    String? id,
    String? type,
    num? discount,
    num? subTotal,
    num? totalPrice,
    List<OrderProducts>? products,
    List<Statuses>? statuses,
    String? invoice,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _type = type;
    _discount = discount;
    _subTotal = subTotal;
    _totalPrice = totalPrice;
    _products = products;
    _statuses = statuses;
    _invoice = invoice;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  OrderDetailsData.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
    _discount = json['discount'];
    _subTotal = json['subTotal'];
    _totalPrice = json['totalPrice'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(OrderProducts.fromJson(v));
      });
    }
    if (json['statuses'] != null) {
      _statuses = [];
      json['statuses'].forEach((v) {
        _statuses?.add(Statuses.fromJson(v));
      });
    }
    _invoice = json['invoice'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  String? _id;
  String? _type;
  num? _discount;
  num? _subTotal;
  num? _totalPrice;
  List<OrderProducts>? _products;
  List<Statuses>? _statuses;
  String? _invoice;
  String? _createdAt;
  String? _updatedAt;
  OrderDetailsData copyWith({
    String? id,
    String? type,
    num? discount,
    num? subTotal,
    num? totalPrice,
    List<OrderProducts>? products,
    List<Statuses>? statuses,
    String? invoice,
    String? createdAt,
    String? updatedAt,
  }) =>
      OrderDetailsData(
        id: id ?? _id,
        type: type ?? _type,
        discount: discount ?? _discount,
        subTotal: subTotal ?? _subTotal,
        totalPrice: totalPrice ?? _totalPrice,
        products: products ?? _products,
        statuses: statuses ?? _statuses,
        invoice: invoice ?? _invoice,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  String? get id => _id;
  String? get type => _type;
  num? get discount => _discount;
  num? get subTotal => _subTotal;
  num? get totalPrice => _totalPrice;
  List<OrderProducts>? get products => _products;
  List<Statuses>? get statuses => _statuses;
  String? get invoice => _invoice;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    map['discount'] = _discount;
    map['subTotal'] = _subTotal;
    map['totalPrice'] = _totalPrice;
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    if (_statuses != null) {
      map['statuses'] = _statuses?.map((v) => v.toJson()).toList();
    }
    map['invoice'] = _invoice;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }
}

/// at : "2022-10-05T10:50:55.453Z"
/// status : "Pending payment"

class Statuses {
  Statuses({
    String? at,
    String? status,
  }) {
    _at = at;
    _status = status;
  }

  Statuses.fromJson(dynamic json) {
    _at = json['at'];
    _status = json['status'];
  }
  String? _at;
  String? _status;
  Statuses copyWith({
    String? at,
    String? status,
  }) =>
      Statuses(
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

/// id : "633c3952d5ea0d23b2d0b02e"
/// name : "Salad"
/// qty : 11
/// price : 1000
/// warrantyExpiresAt : "2022-11-05T10:50:55.453Z"

class OrderProducts {
  OrderProducts({
    String? id,
    String? name,
    num? qty,
    num? price,
    String? warrantyExpiresAt,
  }) {
    _id = id;
    _name = name;
    _qty = qty;
    _price = price;
    _warrantyExpiresAt = warrantyExpiresAt;
  }

  OrderProducts.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _qty = json['qty'];
    _price = json['price'];
    _warrantyExpiresAt = json['warrantyExpiresAt'];
  }
  String? _id;
  String? _name;
  num? _qty;
  num? _price;
  String? _warrantyExpiresAt;
  OrderProducts copyWith({
    String? id,
    String? name,
    num? qty,
    num? price,
    String? warrantyExpiresAt,
  }) =>
      OrderProducts(
        id: id ?? _id,
        name: name ?? _name,
        qty: qty ?? _qty,
        price: price ?? _price,
        warrantyExpiresAt: warrantyExpiresAt ?? _warrantyExpiresAt,
      );
  String? get id => _id;
  String? get name => _name;
  num? get qty => _qty;
  num? get price => _price;
  String? get warrantyExpiresAt => _warrantyExpiresAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['qty'] = _qty;
    map['price'] = _price;
    map['warrantyExpiresAt'] = _warrantyExpiresAt;
    return map;
  }
}
