import 'package:e_commerece_app/core/enitites/UserDataEntities.dart';
import 'package:equatable/equatable.dart';


// ignore: must_be_immutable
class  BaseRegisterEntities extends Equatable{
   String? _message;
   bool? _status;
   UserDataEntities? _registerEntities;

   BaseRegisterEntities({
     String? message,
     bool? status,
     UserDataEntities? registerEntities,
}){
   _message = message;
   _status = status;
   _registerEntities = registerEntities;
   }

   String get message => _message ?? "";

  @override
  List<Object?> get props => [];

   bool get status => _status ?? false; 

   UserDataEntities get registerEntities => _registerEntities ?? UserDataEntities(email: "", mobile: "", name: "", id: 0, image: "", token: "");
}


