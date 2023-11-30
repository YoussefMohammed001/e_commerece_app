import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/cart/data/data_sources/cart_api.dart';
import 'package:e_commerece_app/features/cart/data/models/request_data.dart';
import 'package:e_commerece_app/features/cart/domain/entities/cart_enitites.dart';
import 'package:e_commerece_app/features/cart/domain/repositories/base_cart_repo.dart';
import 'package:either_dart/src/either.dart';

class CartRepo extends BaseCartRepo{
  final BaseCartApi baseCartApi;
  CartRepo(this.baseCartApi);

  @override
  Future<Either<String, CartEntities>> getCart() async {
   final result = await baseCartApi.getCart();
   try{
     return Right(result);
   } catch (e){
     return Left("");
   }
  }

  @override
  Future<Either<String, String>> postCart({required CarRequestData requestData}) async {
    final result = await baseCartApi.postCart(carRequestData: requestData);
    try{
      return Right(result);
    } catch (e){
      return Left(result);
    }
  }

  @override
  Future<Either<String, UpdateDeleteCartEntities>> updateCart({required CarRequestData requestData}) async {
    final result = await baseCartApi.updateCart(carRequestData: requestData);
   safePrint(result);
    try{
      return Right(result);
    } catch (e){
      return Left('');
    }
  }

  @override
  Future<Either<String, UpdateDeleteCartEntities>> delete({required CarRequestData requestData}) async {
    final result = await baseCartApi.deleteCart(carRequestData: requestData);
   safePrint(result);
    try{
      return Right(result);
    } catch (e){
      return Left('');
    }
  }

}