import 'package:e_commerece_app/features/orders/domain/entities/orders_entities.dart';
import 'package:either_dart/either.dart';

abstract class OrderBaseRepo{

  Future<Either<String,List<OrderEntities>>> getOrders();
  Future<Either<String,OrderEntities>> getOrdersDetails({required String id});


}