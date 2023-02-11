import 'dart:convert';

/// data : {"id":"000000050000000000000000","description":"لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور أنكايديد يونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريد أكسير سيتاشن يللأمكو لابورأس نيسي يت أليكيوب أكس أيا كوممودو كونسيكيوات.","whatsApp":["+963962213470"],"phones":[],"mobiles":[],"instagram":"vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv","facebook":"jjjj","linkedIn":"ggg","snapchat":"ggg"}

AboutUs aboutUsFromJson(String str) => AboutUs.fromJson(json.decode(str));

String aboutUsToJson(AboutUs data) => json.encode(data.toJson());

class AboutUs {
  AboutUs({
    Data? data,
  }) {
    _data = data;
  }

  AboutUs.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Data? _data;

  AboutUs copyWith({
    Data? data,
  }) =>
      AboutUs(
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

/// id : "000000050000000000000000"
/// description : "لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور أنكايديد يونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريد أكسير سيتاشن يللأمكو لابورأس نيسي يت أليكيوب أكس أيا كوممودو كونسيكيوات."
/// whatsApp : ["+963962213470"]
/// phones : []
/// mobiles : []
/// instagram : "vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv"
/// facebook : "jjjj"
/// linkedIn : "ggg"
/// snapchat : "ggg"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? id,
    String? description,
    List<String>? whatsApp,
    List<dynamic>? phones,
    List<dynamic>? mobiles,
    String? instagram,
    String? facebook,
    String? linkedIn,
    String? snapchat,
  }) {
    _id = id;
    _description = description;
    _whatsApp = whatsApp;
    _phones = phones;
    _mobiles = mobiles;
    _instagram = instagram;
    _facebook = facebook;
    _linkedIn = linkedIn;
    _snapchat = snapchat;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _description = json['description'];
    _whatsApp = json['whatsApp'] != null ? json['whatsApp'].cast<String>() : [];
    if (json['phones'] != null) {
      _phones = [];
      json['phones'].forEach((v) {
        _phones?.add(v.toString());
      });
    }
    if (json['mobiles'] != null) {
      _mobiles = [];
      json['mobiles'].forEach((v) {
        _mobiles?.add(v.toString());
      });
    }
    _instagram = json['instagram'];
    _facebook = json['facebook'];
    _linkedIn = json['linkedIn'];
    _snapchat = json['snapchat'];
  }

  String? _id;
  String? _description;
  List<String>? _whatsApp;
  List<dynamic>? _phones;
  List<dynamic>? _mobiles;
  String? _instagram;
  String? _facebook;
  String? _linkedIn;
  String? _snapchat;

  Data copyWith({
    String? id,
    String? description,
    List<String>? whatsApp,
    List<dynamic>? phones,
    List<dynamic>? mobiles,
    String? instagram,
    String? facebook,
    String? linkedIn,
    String? snapchat,
  }) =>
      Data(
        id: id ?? _id,
        description: description ?? _description,
        whatsApp: whatsApp ?? _whatsApp,
        phones: phones ?? _phones,
        mobiles: mobiles ?? _mobiles,
        instagram: instagram ?? _instagram,
        facebook: facebook ?? _facebook,
        linkedIn: linkedIn ?? _linkedIn,
        snapchat: snapchat ?? _snapchat,
      );

  String? get id => _id;

  String? get description => _description;

  List<String>? get whatsApp => _whatsApp;

  List<dynamic>? get phones => _phones;

  List<dynamic>? get mobiles => _mobiles;

  String? get instagram => _instagram;

  String? get facebook => _facebook;

  String? get linkedIn => _linkedIn;

  String? get snapchat => _snapchat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['description'] = _description;
    map['whatsApp'] = _whatsApp;
    if (_phones != null) {
      map['phones'] = _phones?.map((v) => v.toJson()).toList();
    }
    if (_mobiles != null) {
      map['mobiles'] = _mobiles?.map((v) => v.toJson()).toList();
    }
    map['instagram'] = _instagram;
    map['facebook'] = _facebook;
    map['linkedIn'] = _linkedIn;
    map['snapchat'] = _snapchat;
    return map;
  }
}
