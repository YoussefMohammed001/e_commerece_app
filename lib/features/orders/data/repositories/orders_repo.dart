import 'package:e_commerece_app/features/orders/data/data_sources/orders_api.dart';
import 'package:e_commerece_app/features/orders/data/order_data.dart';
import 'package:e_commerece_app/features/orders/domain/entities/order_details_entities.dart';
import 'package:e_commerece_app/features/orders/domain/entities/orders_entity.dart';
import 'package:e_commerece_app/features/orders/domain/repositories/base_orders_repo.dart';
import 'package:either_dart/src/either.dart';

class OrdersRepo extends BaseOrdersRepo{
  final BaseOrdersApi baseOrdersApi;
  OrdersRepo(this.baseOrdersApi);

  @override
  Future<Either<String, String>> addOrder({required OrderData orderData}) async {
   final result =await baseOrdersApi.addOrder(orderData: orderData);
   try{
     return Right(result);
   } catch (e){
     return Left(result);
   }
  }

  @override
  Future<Either<String, String>> cancelOrder({required OrderData orderData}) async {
    final result =await baseOrdersApi.cancelOrder(orderData: orderData);
    try{
      return Right(result);
    } catch (e){
      return Left(result);
    }
  }

  @override
  Future<Either<String, List<OrdersEntities>>> getOrders() async {
    final result =await baseOrdersApi.getOrders();
    try{
      return Right(result);
    } catch (e){
      return Left("");
    }
  }

  @override
  Future<Either<String, OrderDetailsEntity>> ordersDetails({required OrderData orderData}) async {
    final result =await baseOrdersApi.getOrderDetails(orderData: orderData);
    try{
      return Right(result);
    } catch (e){
      return Left("");
    }
  }

}