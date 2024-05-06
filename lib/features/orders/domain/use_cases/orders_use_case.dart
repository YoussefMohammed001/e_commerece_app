import 'package:e_commerece_app/features/orders/domain/entities/orders_entities.dart';
import 'package:e_commerece_app/features/orders/domain/repositories/order_base_repo.dart';
import 'package:either_dart/either.dart';

class OrdersUseCase{

  final OrderBaseRepo orderBaseRepo;
  OrdersUseCase(this.orderBaseRepo);


  Future<Either<String,List<OrderEntities>>> execute() async {
    return await orderBaseRepo.getOrders();
  }


  Future<Either<String,OrderEntities>> executeDetails({required String id}) async {
    return await orderBaseRepo.getOrdersDetails(id: id);
  }




}