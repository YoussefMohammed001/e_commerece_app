import 'package:e_commerece_app/features/confirm_order/data/data_sources/add_order_data_source.dart';
import 'package:e_commerece_app/features/confirm_order/domain/repositories/add_order_base_repo.dart';
import 'package:either_dart/either.dart';

class AddOrderRepo extends AddOrderBaseRepo{
  AddOrderBaseDataSource addOrderBaseDataSource;

  AddOrderRepo(this.addOrderBaseDataSource);

  @override
  Future<Either<String, String>> addOrder() async {
    final result =await  addOrderBaseDataSource.addOrder();
    try{
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

}