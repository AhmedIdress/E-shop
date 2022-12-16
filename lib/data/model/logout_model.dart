class LogoutModel {
  bool? status;
  String? message;
  Data? data;

  LogoutModel({this.status, this.message, this.data});

  LogoutModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? id;
  String? token;

  Data({this.id, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
  }
}