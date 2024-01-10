import 'package:e_commerece_app/core/api/end_points.dart';
import 'package:e_commerece_app/core/api/my_dio.dart';
import 'package:e_commerece_app/features/cart/data/models/cart_data_request.dart';
import 'package:e_commerece_app/features/cart/data/models/get_cart_model.dart';
import 'package:e_commerece_app/features/cart/data/models/update_or_delete_cart_model.dart';

abstract class BaseCartApi{
  Future<String> addToCartApi({required CartDataRequest cartDataRequest});
  Future<GetCartModel> getCartApi();
  Future<UpdateOrDeleteCartModel> deleteCartApi({required CartDataRequest cartDataRequest});
  Future<UpdateOrDeleteCartModel> updateCartApi({required CartDataRequest cartDataRequest});
}

class CartApi extends BaseCartApi{
  @override
  Future<String> addToCartApi({required CartDataRequest cartDataRequest}) async {
    final response = await AppDio.post(endPoint: EndPoints.cart,data: {

        "product_id": cartDataRequest.id

    });
    if(response!.data['status'] == true){
      return  response.data['message'];
    } else{
      return response.data['message'];
    }

  }

  @override
  Future<GetCartModel> getCartApi() async {
    final response = await AppDio.get(endPoint: EndPoints.cart,);
    if(response!.data['status'] == true){
      return  GetCartModel.fromJson(response.data['data']);
    } else{
      return  GetCartModel.fromJson(response.data['data']);
    }

  }

  @override
  Future<UpdateOrDeleteCartModel> updateCartApi({required CartDataRequest cartDataRequest}) async {
    final response = await AppDio.put(endPoint: "${EndPoints.cart}/${cartDataRequest.id}",data: {
      "quantity": cartDataRequest.quantity
    });
    if(response!.data['status'] == true){
      return  UpdateOrDeleteCartModel.fromJson(response.data['data']);
    } else{
      return  UpdateOrDeleteCartModel.fromJson(response.data['data']);
    }

  }

  @override
  Future<UpdateOrDeleteCartModel> deleteCartApi({required CartDataRequest cartDataRequest}) async {
    final response = await AppDio.delete(endPoint: "${EndPoints.cart}/${cartDataRequest.id}");
    if(response!.data['status'] == true){
      return  UpdateOrDeleteCartModel.fromJson(response.data['data']);
    } else{
      return  UpdateOrDeleteCartModel.fromJson(response.data['data']);
    }

  }

}