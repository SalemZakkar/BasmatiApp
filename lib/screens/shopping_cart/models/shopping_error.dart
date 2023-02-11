/// code : "1420"
/// msg : "Some Products not found or not available."
/// args : [{"value":"6327229dda6d9ddb17b475c2","path":"products[0].id"}]

class ShoppingError {
  ShoppingError({
    String? code,
    String? msg,
    List<Args>? args,
  }) {
    _code = code;
    _msg = msg;
    _args = args;
  }

  ShoppingError.fromJson(dynamic json) {
    _code = json['code'];
    _msg = json['msg'];
    if (json['args'] != null) {
      _args = [];
      json['args'].forEach((v) {
        _args?.add(Args.fromJson(v));
      });
    }
  }
  String? _code;
  String? _msg;
  List<Args>? _args;
  ShoppingError copyWith({
    String? code,
    String? msg,
    List<Args>? args,
  }) =>
      ShoppingError(
        code: code ?? _code,
        msg: msg ?? _msg,
        args: args ?? _args,
      );
  String? get code => _code;
  String? get msg => _msg;
  List<Args>? get args => _args;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['msg'] = _msg;
    if (_args != null) {
      map['args'] = _args?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// value : "6327229dda6d9ddb17b475c2"
/// path : "products[0].id"

class Args {
  Args({
    String? value,
    String? path,
  }) {
    _value = value;
    _path = path;
  }

  Args.fromJson(dynamic json) {
    _value = json['value'];
    _path = json['path'];
  }
  String? _value;
  String? _path;
  Args copyWith({
    String? value,
    String? path,
  }) =>
      Args(
        value: value ?? _value,
        path: path ?? _path,
      );
  String? get value => _value;
  String? get path => _path;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = _value;
    map['path'] = _path;
    return map;
  }
}
