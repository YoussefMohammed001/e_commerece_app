import 'package:e_commerece_app/core/api/end_points.dart';
import 'package:e_commerece_app/core/api/my_dio.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';

abstract class BaseChangePassDataSource{
  Future<String> changePassApi({required String cPass, required String pass});
}


class ChangePassDataSource extends BaseChangePassDataSource{
  @override
  Future<String> changePassApi({required String cPass, required String pass}) async {
    final response = await AppDio.put(endPoint: EndPoints.changePass,
        data: {
        "current_password" : cPass,
          "new_password": pass,

        }
    );
    safePrint(response);
    if(response!.data['status'] == true){
      return response.data['message'];
    }
    else {
      return response.data['message'];
    }

  }

}