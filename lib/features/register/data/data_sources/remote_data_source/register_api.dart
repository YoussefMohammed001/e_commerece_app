import 'package:e_commerece_app/core/api/end_points.dart';
import 'package:e_commerece_app/core/api/my_dio.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/register/data/models/register_model.dart';
import 'package:e_commerece_app/features/register/data/register_data.dart';

abstract class BaseRegisterApi{

  Future<BaseRegisterModel> register(RegisterData registerData);

}

class RegisterApi extends BaseRegisterApi{
  @override
  Future<BaseRegisterModel> register(RegisterData registerData) async {
   final response = await AppDio.post(endPoint: EndPoints.register,data: {
     "name" : registerData.name,
     "email" : registerData.email,
     "phone" : registerData.phone,
     "password" : registerData.password,
   });
   safePrint("register response==========================> $response");
   BaseRegisterModel baseRegisterModel = BaseRegisterModel.fromJson(response!.data);

   if(baseRegisterModel.status == true){
     return baseRegisterModel;
   }else{
     return baseRegisterModel;
   }

  }

}