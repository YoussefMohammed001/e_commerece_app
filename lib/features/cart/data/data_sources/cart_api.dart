import 'package:e_commerece_app/core/api/end_points.dart';
import 'package:e_commerece_app/core/api/my_dio.dart';
import 'package:e_commerece_app/core/shared/my_shared.dart';
import 'package:e_commerece_app/core/shared/my_shared_keys.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/cart/data/models/cart_model.dart';
import 'package:e_commerece_app/features/cart/data/models/request_data.dart';

abstract class BaseCartApi{

  Future<GetCartModel> getCart();
  Future<String> postCart({required CarRequestData carRequestData});
  Future<DeleteUpdateCartModel> updateCart({required CarRequestData carRequestData});
  Future<DeleteUpdateCartModel> deleteCart({required CarRequestData carRequestData});
}



class CartApi extends BaseCartApi{
  @override
  Future<GetCartModel> getCart() async {
    final response = await AppDio.get(endPoint: EndPoints.cart);
    if(response!.data["status"] == true){
      return GetCartModel.fromJson(response.data['data']);
    } else{
      throw "";
    }
  }

  @override
  Future<String> postCart({required CarRequestData carRequestData}) async {
    final response = await AppDio.post(endPoint: EndPoints.cart,data: {
      "product_id":carRequestData.id,
    });
    safePrint(response!.data);
  if(response.data['status'] == true){
    await MyShared.putString(key: MySharedKeys.cartId, value:  response.data['data']['id'].toString());
    safePrint(MyShared.getString(key: MySharedKeys.cartId));
    return response.data['data']['quantity'].toString();
  } else {
    return response.data['message'];
  }

  }

  @override
  Future<DeleteUpdateCartModel> updateCart({required CarRequestData carRequestData}) async {
    final response = await AppDio.put(endPoint: "${EndPoints.cart}/${carRequestData.id}",data: {
      "quantity":carRequestData.quantity,
    });
    safePrint(response);
    if(response!.data['status'] == true){
      return DeleteUpdateCartModel.fromJson(response.data['data']);
    } else {
      return response.data['message'];
    }
  }

  @override
  Future<DeleteUpdateCartModel> deleteCart({required CarRequestData carRequestData}) async {
    final response = await AppDio.delete(endPoint: "${EndPoints.cart}/${carRequestData.id}",);
    safePrint(response);
    if(response!.data['status'] == true){
      return DeleteUpdateCartModel.fromJson(response.data['data']);
    } else {
      return response.data['message'];
    }
  }







}