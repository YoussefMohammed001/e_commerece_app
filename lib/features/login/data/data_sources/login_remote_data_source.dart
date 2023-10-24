import 'package:e_commerece_app/core/api/end_points.dart';
import 'package:e_commerece_app/core/api/my_dio.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/login/data/models/login_model.dart';

abstract class BaseLoginRemoteDataSource{
  Future<LoginRequestModel> login({required String email,required String password});

}

 class LoginRemoteDataSource extends BaseLoginRemoteDataSource{

  @override
  Future<LoginRequestModel> login({required String email,required String password}) async {
    final response = await AppDio.post(endPoint: EndPoints.login,data: {
      "email":email,
      "password":password,
    });

    LoginRequestModel loginModel = LoginRequestModel.fromJson(response!.data);

    if(loginModel.apiStatus == true) {
      safePrint(response);
      safePrint("response===============>$response");
      return loginModel;
    }else{
      safePrint("error===============>$response");

      return loginModel;
    }


  }





}