import 'package:e_commerece_app/features/register/domain/entities/register_entities.dart';

// ignore: must_be_immutable
class BaseRegisterModel extends BaseRegisterEntities {
  BaseRegisterModel({required super.message, required super.status, required super.registerEntities});
  factory BaseRegisterModel.fromJson(Map<String, dynamic> json) => BaseRegisterModel(
      message: json['message'],
      status: json['status'],
      registerEntities:json['status'] == true ? RegisterModel.fromJson(json['data']) :RegisterEntities(email: '', mobile: '', name: '', id: 0, image: '', token: '')
  );

}
class RegisterModel extends RegisterEntities{
  RegisterModel({required super.email, required super.mobile, required super.name, required super.id, required super.image, required super.token});

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    mobile: json['phone'],
    image: json['image'],
    token: json['token'],
  );





}