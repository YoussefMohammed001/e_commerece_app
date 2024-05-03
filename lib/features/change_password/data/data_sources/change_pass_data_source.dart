import 'package:e_commerece_app/core/api/end_points.dart';
import 'package:e_commerece_app/core/api/my_dio.dart';
import 'package:e_commerece_app/core/shared/my_shared.dart';
import 'package:e_commerece_app/core/shared/my_shared_keys.dart';

abstract class BaseChangePassDataSource{
  Future<String> changePassApi({required String pass});
}


class ChangePassDataSource extends BaseChangePassDataSource{
  @override
  Future<String> changePassApi({required String pass}) async {
    final response = await AppDio.put(endPoint: EndPoints.updateProfile,
        data: {
          "name": MyShared.getString(key: MySharedKeys.username),
          "phone": MyShared.getString(key: MySharedKeys.phone),
          "email": MyShared.getString(key: MySharedKeys.email),
          "password": pass,

        }
    );
    print(response);
    if(response!.data['status'] == true){
      return "Password Changed Successfully";
    }
    else {
      return response.data['message'];
    }

  }

}