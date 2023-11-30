import 'package:e_commerece_app/features/orders/data/order_data.dart';
import 'package:e_commerece_app/features/orders/domain/entities/order_details_entities.dart';
import 'package:e_commerece_app/features/orders/domain/entities/orders_entity.dart';
import 'package:e_commerece_app/features/orders/domain/repositories/base_orders_repo.dart';
import 'package:either_dart/either.dart';

class OrderUseCase{
  final BaseOrdersRepo baseOrdersRepo;
  OrderUseCase(this.baseOrdersRepo);

  Future<Either<String,String>> addOrder({required OrderData orderData}) async {
    return await baseOrdersRepo.addOrder(orderData: orderData);
  }
  Future<Either<String,List<OrdersEntities>>> getOrders() async {
    return await  baseOrdersRepo.getOrders();

  }
  Future<Either<String,OrderDetailsEntity>> ordersDetails({required OrderData orderData}) async {
    return await  baseOrdersRepo.ordersDetails(orderData: orderData);

  }
  Future<Either<String,String>> cancelOrder({required OrderData orderData}) async {
    return await  baseOrdersRepo.cancelOrder(orderData: orderData);

  }


}