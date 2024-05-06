import 'package:e_commerece_app/core/api/end_points.dart';
import 'package:e_commerece_app/core/api/my_dio.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/orders/data/models/get_orders.dart';
import 'package:e_commerece_app/features/orders/data/models/get_orders_details.dart';

abstract class BaseOrdersApi{
  Future<List<OrdersModel>> getOrders();
  Future<GetOrdersDetailsModel> getOrderDetails({required String id});
}

class OrdersApi extends  BaseOrdersApi{

  @override
  Future<GetOrdersDetailsModel> getOrderDetails({required String id}) async {
    final response = await AppDio.get(endPoint: "${EndPoints.orders}/$id");
    if(response!.data['status'] == true){
      safePrint("===============>${response.data['data']}");
      return GetOrdersDetailsModel.fromJson(response.data['data']);
    } else{
      return  response.data['message'];
    }
  }



  @override
  Future<List<OrdersModel>> getOrders() async {
    final response = await AppDio.get(endPoint: EndPoints.orders);
   if(response!.data['status'] == true){
    return  List<OrdersModel>
         .from((response.data['data']['data'] as List).map((e) =>
         OrdersModel.fromJson(e)));
   } else{
     return  response.data['message'];
   }
  }

}