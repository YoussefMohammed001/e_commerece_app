import 'package:e_commerece_app/core/api/end_points.dart';
import 'package:e_commerece_app/core/api/my_dio.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/orders/data/models/order_details_model.dart';
import 'package:e_commerece_app/features/orders/data/models/orders_model.dart';
import 'package:e_commerece_app/features/orders/data/order_data.dart';

abstract class BaseOrdersApi{

  Future<List<OrdersModel>> getOrders();
  Future<OrderDetailsModel> getOrderDetails({required OrderData orderData});
  Future<String> addOrder({required OrderData orderData});
  Future<String> cancelOrder({required OrderData orderData});
}


class OrdersApi extends BaseOrdersApi{

  @override
  Future<String> addOrder({required OrderData orderData}) async {

   final response = await AppDio.post(endPoint: EndPoints.orders,data: {
     "address_id" : orderData.addressId,
     "payment_method":"1",
     "use_points":"false",

   });
   if(response!.data['status'] == true){
     safePrint("response ==================>$response");
     return response.data['message'];
   } else{
     return response.data['message'];
   }
  }

  @override
  Future<String> cancelOrder({required OrderData orderData}) async {
    final response = await AppDio.get(endPoint: "${EndPoints.orders}/${orderData.orderId}/cancel");
    safePrint(response);
    if(response!.data['status'] == true){
      return response.data['message'];
    } else{
      return response.data['message'];
    }
  }


  @override
  Future<OrderDetailsModel> getOrderDetails({required OrderData orderData}) async {
    final response = await AppDio.get(endPoint: "${EndPoints.orders}/${orderData.orderId}");
    if(response!.data['status'] == true){
      return OrderDetailsModel.fromJson(response.data['data']);

    } else{
     return response.data['message'];
    }
  }

  @override
  Future<List<OrdersModel>> getOrders() async {
    final response = await AppDio.get(endPoint: EndPoints.orders);
    if(response!.data['status'] == true){
      return List<OrdersModel>
          .from((response.data['data']['data'] as List).map((e) =>
          OrdersModel.fromJson(e)
      ));

    } else{
      throw response.data['message'];
    }
  }

}