import 'package:e_commerece_app/core/enitites/UserDataEntities.dart';

class LoginRequestModel {
  LoginRequestModel({
    bool? apiStatus,
    LoginModel? data,
    String? message,
  }) {
    _apiStatus = apiStatus;
    _data = data;
    _message = message;
  }

  LoginRequestModel.fromJson(dynamic json) {
    _apiStatus = json['status'];
    _data = json['data'] != null ? LoginModel.fromJson(json['data']) : null;
    _message = json['message'];
  }
  bool? _apiStatus;
  LoginModel? _data;
  String? _message;

  bool get apiStatus => _apiStatus ?? false;
  LoginModel get data =>
      _data ??
      LoginModel(email: "", mobile: "", name: "", id: 0, image: "", token: "");
  String get message => _message ?? "";
}

class LoginModel extends UserDataEntities {
  LoginModel(
      {required super.email,
      required super.mobile,
      required super.name,
      required super.id,
      required super.image,
      required super.token,});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        mobile: json['phone'],
        image: json['image'],
        token: json['token'],
      );
}
