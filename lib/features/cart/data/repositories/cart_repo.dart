import 'package:e_commerece_app/features/cart/data/data_sources/cart_api.dart';
import 'package:e_commerece_app/features/cart/data/models/cart_data_request.dart';
import 'package:e_commerece_app/features/cart/domain/entities/get_cart_entities.dart';
import 'package:e_commerece_app/features/cart/domain/entities/update_or_delete_cart_entites.dart';
import 'package:e_commerece_app/features/cart/domain/repositories/base_cart_repo.dart';
// ignore: implementation_imports
import 'package:either_dart/src/either.dart';

class CartRepo extends BaseCartRepo{

  final BaseCartApi baseCartApi;

  CartRepo(this.baseCartApi);

  @override
  Future<Either<String, String>> addToCart({required CartDataRequest cartDataRequest}) async {
    final result = await baseCartApi.addToCartApi(cartDataRequest: cartDataRequest);
    try{
      return Right(result);
    } catch (e){
      return const Left("error");
    }


  }

  @override
  Future<Either<String, GetCartDataEntities>> getCart() async {
    final result = await baseCartApi.getCartApi();
    try{
      return Right(result);
    } catch (e){
      return const Left("error");
    }

  }

  @override
  Future<Either<String, UpdateOrDeleteCartEntities>> updateOrDeleteCart({required CartDataRequest cartDataRequest}) async {
    final result = await baseCartApi.updateCartApi(cartDataRequest: cartDataRequest);
    try{
      return Right(result);
    } catch (e){
      return const Left("error");
    }

  }

}