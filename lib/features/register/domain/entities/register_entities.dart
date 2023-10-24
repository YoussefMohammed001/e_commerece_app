import 'package:equatable/equatable.dart';


// ignore: must_be_immutable
class  BaseRegisterEntities extends Equatable{
   String? _message;
   bool? _status;
   RegisterEntities? _registerEntities;

   BaseRegisterEntities({
     String? message,
     bool? status,
     RegisterEntities? registerEntities,
}){
   _message = message;
   _status = status;
   _registerEntities = registerEntities;
   }

   String get message => _message ?? "";

  @override
  List<Object?> get props => [];

   bool get status => _status ?? false; 

   RegisterEntities get registerEntities => _registerEntities ?? RegisterEntities(email: "", mobile: "", name: "", id: 0, image: "", token: "");
}


class RegisterEntities extends Equatable{

  final String email;
  final String mobile;
  final String name;
  final int id;
  final String image;
  final String token;

  RegisterEntities(
      {required this.email,
        required this.mobile,
        required this.name,
        required this.id,
        required this.image,
        required this.token,
      });

  @override
  List<Object?> get props => [
    id,
    email,
    name,
    mobile,
    image,
    token,

  ];




}