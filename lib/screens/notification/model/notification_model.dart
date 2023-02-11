/// totalRecords : 22
/// data : [{"id":"6331b26581bc990db5ab8574","title":"bplbplbplbplbplbplbplbpl","body":"is animal","markedAsRead":false,"createdAt":"2022-09-26T14:08:37.863Z"},{"id":"6331b25281bc990db5ab855b","title":"bplbplbplbplbplbplbplbpl","body":"is animal","markedAsRead":false,"createdAt":"2022-09-26T14:08:18.330Z"},{"id":"6331b22e81bc990db5ab8542","title":"rawan","body":"is animal","markedAsRead":false,"createdAt":"2022-09-26T14:07:42.967Z"},{"id":"63309dbe81bc990db5ab8508","title":"rawan","body":"is animal","markedAsRead":false,"createdAt":"2022-09-25T18:28:14.394Z"},{"id":"63309d8981bc990db5ab84ef","title":"love y","body":"love you","markedAsRead":false,"createdAt":"2022-09-25T18:27:21.816Z"},{"id":"63309d5e81bc990db5ab84d6","title":"test","body":"test","markedAsRead":false,"createdAt":"2022-09-25T18:26:38.734Z"},{"id":"63309cb281bc990db5ab84bd","title":"test","body":"test","markedAsRead":false,"createdAt":"2022-09-25T18:23:46.659Z"},{"id":"63309c8d81bc990db5ab84a4","title":"test","body":"test","markedAsRead":false,"createdAt":"2022-09-25T18:23:09.406Z"},{"id":"63309c6981bc990db5ab849d","title":"test","body":"test","markedAsRead":false,"createdAt":"2022-09-25T18:22:33.112Z"},{"id":"63309c0781bc990db5ab847b","title":"test","body":"test","markedAsRead":false,"createdAt":"2022-09-25T18:20:55.599Z"}]

class NotificationModel {
  NotificationModel({
    num? totalRecords,
    List<NotificationData>? data,
  }) {
    _totalRecords = totalRecords;
    _data = data;
  }

  NotificationModel.fromJson(dynamic json) {
    _totalRecords = json['totalRecords'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(NotificationData.fromJson(v));
      });
    }
  }
  num? _totalRecords;
  List<NotificationData>? _data;
  NotificationModel copyWith({
    num? totalRecords,
    List<NotificationData>? data,
  }) =>
      NotificationModel(
        totalRecords: totalRecords ?? _totalRecords,
        data: data ?? _data,
      );
  num? get totalRecords => _totalRecords;
  List<NotificationData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['totalRecords'] = _totalRecords;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : "6331b26581bc990db5ab8574"
/// title : "bplbplbplbplbplbplbplbpl"
/// body : "is animal"
/// markedAsRead : false
/// createdAt : "2022-09-26T14:08:37.863Z"

class NotificationData {
  NotificationData({
    String? id,
    String? title,
    String? body,
    bool? markedAsRead,
    String? createdAt,
  }) {
    _id = id;
    _title = title;
    _body = body;
    _markedAsRead = markedAsRead;
    _createdAt = createdAt;
  }

  NotificationData.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _body = json['body'];
    _markedAsRead = json['markedAsRead'];
    _createdAt = json['createdAt'];
  }
  String? _id;
  String? _title;
  String? _body;
  bool? _markedAsRead;
  String? _createdAt;
  NotificationData copyWith({
    String? id,
    String? title,
    String? body,
    bool? markedAsRead,
    String? createdAt,
  }) =>
      NotificationData(
        id: id ?? _id,
        title: title ?? _title,
        body: body ?? _body,
        markedAsRead: markedAsRead ?? _markedAsRead,
        createdAt: createdAt ?? _createdAt,
      );
  String? get id => _id;
  String? get title => _title;
  String? get body => _body;
  bool? get markedAsRead => _markedAsRead;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['body'] = _body;
    map['markedAsRead'] = _markedAsRead;
    map['createdAt'] = _createdAt;
    return map;
  }
}
