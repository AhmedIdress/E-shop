class NotificationModel {
  late String _title, _content;
  String get title => _title;
  String get content => _content;
  NotificationModel(this._content, this._title);

  NotificationModel.fromJson(Map<String, dynamic> map) {
    _title = map['title'];
    _content = map['content'];
  }

  Map<String, dynamic> toJson(Map<String, dynamic> map) {
    return {'title': _title,
    'content':_content,};
  }
}
