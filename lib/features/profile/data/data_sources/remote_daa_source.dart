import 'package:e_commerece_app/core/api/end_points.dart';
import 'package:e_commerece_app/core/api/my_dio.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/login/data/models/login_model.dart';
import 'package:e_commerece_app/features/register/data/register_data.dart';

abstract class BaseProfileApi{
  Future<LoginRequestModel> updateData({required RegisterData registerData});
}


class UpdateProfileApi extends BaseProfileApi{
  @override
  Future<LoginRequestModel> updateData({required RegisterData registerData}) async {


    final response = await AppDio.put(endPoint: EndPoints.updateProfile,data: {
      "name" : registerData.name,
      "email" : registerData.email,
      "phone" : registerData.phone,
      "password" : registerData.password,
    });
    safePrint("register response==========================> $response");
    LoginRequestModel baseRegisterModel = LoginRequestModel.fromJson(response!.data['data']);

    if(baseRegisterModel.apiStatus == true){

      return baseRegisterModel;
    }else{
      return baseRegisterModel;
    }



  }

}

