import 'package:e_commerece_app/features/confirm_order/domain/repositories/add_order_base_repo.dart';
import 'package:either_dart/either.dart';

class AddOrderUseCase{
  AddOrderBaseRepo addOrderBaseRepo;

  AddOrderUseCase(this.addOrderBaseRepo);

  Future<Either<String,String>> execute(){
    return addOrderBaseRepo.addOrder();
  }
}