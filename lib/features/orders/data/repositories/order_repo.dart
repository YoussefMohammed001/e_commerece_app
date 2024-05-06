import 'package:e_commerece_app/features/orders/data/data_sources/orders_data_source.dart';
import 'package:e_commerece_app/features/orders/domain/entities/orders_entities.dart';
import 'package:e_commerece_app/features/orders/domain/repositories/order_base_repo.dart';
import 'package:either_dart/either.dart';

class OrderRepo extends OrderBaseRepo {
  final BaseOrdersApi ordersApi;

  OrderRepo(this.ordersApi);


  @override
  Future<Either<String, List<OrderEntities>>> getOrders() async {
    final result = await ordersApi.getOrders();
    try {
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, OrderEntities>> getOrdersDetails({required String id}) async {
    final result = await ordersApi.getOrderDetails(id: id);
    try{
      return Right(result);
    } catch (e){

      return Left(e.toString());
    }
  }

}