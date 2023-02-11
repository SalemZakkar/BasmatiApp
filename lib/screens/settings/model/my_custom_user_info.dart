/// data : {"id":"6325c58f895c8c1c976ccecf","type":"Customer","fullName":"Dr. Tiffany O'Kon","phone":"+966123456789","email":"Jonas98@example.org","isActive":true,"isVerified":{"email":false,"phone":false},"lastLogin":"2022-09-17T13:03:11.206Z","createdAt":"2022-09-17T13:03:11.209Z","updatedAt":"2022-10-04T11:57:49.600Z","subscription":{"id":"000000040000000000000000","name":"jjjjjjj","expiresAt":"2022-12-29T15:29:11.553Z"},"abilities":[{"subject":"User","actions":["password","view-mine","update-mine"]},{"subject":"Product","actions":["view","order"]},{"subject":"Subscription","actions":["view"]},{"subject":"Order","actions":["save","calculate","view","cancel"]},{"subject":"Notification","actions":["view","subscribe","mark-as-read"]}]}

class MyCustomUserInfo {
  MyCustomUserInfo({
    Data? data,
  }) {
    _data = data;
  }

  MyCustomUserInfo.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Data? _data;
  MyCustomUserInfo copyWith({
    Data? data,
  }) =>
      MyCustomUserInfo(
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

/// id : "6325c58f895c8c1c976ccecf"
/// type : "Customer"
/// fullName : "Dr. Tiffany O'Kon"
/// phone : "+966123456789"
/// email : "Jonas98@example.org"
/// isActive : true
/// isVerified : {"email":false,"phone":false}
/// lastLogin : "2022-09-17T13:03:11.206Z"
/// createdAt : "2022-09-17T13:03:11.209Z"
/// updatedAt : "2022-10-04T11:57:49.600Z"
/// subscription : {"id":"000000040000000000000000","name":"jjjjjjj","expiresAt":"2022-12-29T15:29:11.553Z"}
/// abilities : [{"subject":"User","actions":["password","view-mine","update-mine"]},{"subject":"Product","actions":["view","order"]},{"subject":"Subscription","actions":["view"]},{"subject":"Order","actions":["save","calculate","view","cancel"]},{"subject":"Notification","actions":["view","subscribe","mark-as-read"]}]

class Data {
  Data({
    String? id,
    String? type,
    String? fullName,
    String? phone,
    String? email,
    bool? isActive,
    IsVerified? isVerified,
    String? lastLogin,
    String? createdAt,
    String? updatedAt,
    SubscriptionSettings? subscription,
    List<Abilities>? abilities,
  }) {
    _id = id;
    _type = type;
    _fullName = fullName;
    _phone = phone;
    _email = email;
    _isActive = isActive;
    _isVerified = isVerified;
    _lastLogin = lastLogin;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _subscription = subscription;
    _abilities = abilities;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
    _fullName = json['fullName'];
    _phone = json['phone'];
    _email = json['email'];
    _isActive = json['isActive'];
    _isVerified = json['isVerified'] != null
        ? IsVerified.fromJson(json['isVerified'])
        : null;
    _lastLogin = json['lastLogin'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _subscription = json['subscription'] != null
        ? SubscriptionSettings.fromJson(json['subscription'])
        : null;
    if (json['abilities'] != null) {
      _abilities = [];
      json['abilities'].forEach((v) {
        _abilities?.add(Abilities.fromJson(v));
      });
    }
  }
  String? _id;
  String? _type;
  String? _fullName;
  String? _phone;
  String? _email;
  bool? _isActive;
  IsVerified? _isVerified;
  String? _lastLogin;
  String? _createdAt;
  String? _updatedAt;
  SubscriptionSettings? _subscription;
  List<Abilities>? _abilities;
  Data copyWith({
    String? id,
    String? type,
    String? fullName,
    String? phone,
    String? email,
    bool? isActive,
    IsVerified? isVerified,
    String? lastLogin,
    String? createdAt,
    String? updatedAt,
    SubscriptionSettings? subscription,
    List<Abilities>? abilities,
  }) =>
      Data(
        id: id ?? _id,
        type: type ?? _type,
        fullName: fullName ?? _fullName,
        phone: phone ?? _phone,
        email: email ?? _email,
        isActive: isActive ?? _isActive,
        isVerified: isVerified ?? _isVerified,
        lastLogin: lastLogin ?? _lastLogin,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        subscription: subscription ?? _subscription,
        abilities: abilities ?? _abilities,
      );
  String? get id => _id;
  String? get type => _type;
  String? get fullName => _fullName;
  String? get phone => _phone;
  String? get email => _email;
  bool? get isActive => _isActive;
  IsVerified? get isVerified => _isVerified;
  String? get lastLogin => _lastLogin;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  SubscriptionSettings? get subscription => _subscription;
  List<Abilities>? get abilities => _abilities;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    map['fullName'] = _fullName;
    map['phone'] = _phone;
    map['email'] = _email;
    map['isActive'] = _isActive;
    if (_isVerified != null) {
      map['isVerified'] = _isVerified?.toJson();
    }
    map['lastLogin'] = _lastLogin;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    if (_subscription != null) {
      map['subscription'] = _subscription?.toJson();
    }
    if (_abilities != null) {
      map['abilities'] = _abilities?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// subject : "User"
/// actions : ["password","view-mine","update-mine"]

class Abilities {
  Abilities({
    String? subject,
    List<String>? actions,
  }) {
    _subject = subject;
    _actions = actions;
  }

  Abilities.fromJson(dynamic json) {
    _subject = json['subject'];
    _actions = json['actions'] != null ? json['actions'].cast<String>() : [];
  }
  String? _subject;
  List<String>? _actions;
  Abilities copyWith({
    String? subject,
    List<String>? actions,
  }) =>
      Abilities(
        subject: subject ?? _subject,
        actions: actions ?? _actions,
      );
  String? get subject => _subject;
  List<String>? get actions => _actions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['subject'] = _subject;
    map['actions'] = _actions;
    return map;
  }
}

/// id : "000000040000000000000000"
/// name : "jjjjjjj"
/// expiresAt : "2022-12-29T15:29:11.553Z"

class SubscriptionSettings {
  SubscriptionSettings({
    String? id,
    String? name,
    String? expiresAt,
  }) {
    _id = id;
    _name = name;
    _expiresAt = expiresAt;
  }

  SubscriptionSettings.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _expiresAt = json['expiresAt'];
  }
  String? _id;
  String? _name;
  String? _expiresAt;
  SubscriptionSettings copyWith({
    String? id,
    String? name,
    String? expiresAt,
  }) =>
      SubscriptionSettings(
        id: id ?? _id,
        name: name ?? _name,
        expiresAt: expiresAt ?? _expiresAt,
      );
  String? get id => _id;
  String? get name => _name;
  String? get expiresAt => _expiresAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['expiresAt'] = _expiresAt;
    return map;
  }
}

/// email : false
/// phone : false

class IsVerified {
  IsVerified({
    bool? email,
    bool? phone,
  }) {
    _email = email;
    _phone = phone;
  }

  IsVerified.fromJson(dynamic json) {
    _email = json['email'];
    _phone = json['phone'];
  }
  bool? _email;
  bool? _phone;
  IsVerified copyWith({
    bool? email,
    bool? phone,
  }) =>
      IsVerified(
        email: email ?? _email,
        phone: phone ?? _phone,
      );
  bool? get email => _email;
  bool? get phone => _phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['phone'] = _phone;
    return map;
  }
}
