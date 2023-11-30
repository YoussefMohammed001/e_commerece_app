import 'package:e_commerece_app/features/orders/data/order_data.dart';
import 'package:e_commerece_app/features/orders/domain/entities/order_details_entities.dart';
import 'package:e_commerece_app/features/orders/domain/entities/orders_entity.dart';
import 'package:either_dart/either.dart';

abstract class BaseOrdersRepo{
  Future<Either<String,String>> addOrder({required OrderData orderData});
  Future<Either<String,List<OrdersEntities>>> getOrders();
  Future<Either<String,OrderDetailsEntity>> ordersDetails({required OrderData orderData});
  Future<Either<String,String>> cancelOrder({required OrderData orderData});




}