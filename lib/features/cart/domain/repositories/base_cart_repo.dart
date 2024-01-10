import 'package:e_commerece_app/features/cart/data/models/cart_data_request.dart';
import 'package:e_commerece_app/features/cart/domain/entities/get_cart_entities.dart';
import 'package:e_commerece_app/features/cart/domain/entities/update_or_delete_cart_entites.dart';
import 'package:either_dart/either.dart';

abstract class BaseCartRepo{

  Future<Either<String,String>> addToCart({required CartDataRequest cartDataRequest});
  Future<Either<String,GetCartDataEntities>> getCart();
  Future<Either<String,UpdateOrDeleteCartEntities>> updateOrDeleteCart({required CartDataRequest cartDataRequest});

}