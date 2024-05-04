import 'package:e_commerece_app/core/api/end_points.dart';
import 'package:e_commerece_app/core/api/my_dio.dart';
import 'package:e_commerece_app/core/shared/my_shared.dart';
import 'package:e_commerece_app/core/shared/my_shared_keys.dart';

abstract class AddOrderBaseDataSource{
  Future<String> addOrder();

}

class AddOrderDataSource extends AddOrderBaseDataSource{
  @override
  Future<String> addOrder() async {
    final result = await AppDio.post(endPoint: EndPoints.orders,data: {
"address_id":MyShared.getString(key: MySharedKeys.addressId),
"payment_method":  "1",
    "use_points":"false"
    });
    if(result!.data['status'] == true){
      return result.data['message'];
    }  else{
      return result.data['message'];
    }
  }

}