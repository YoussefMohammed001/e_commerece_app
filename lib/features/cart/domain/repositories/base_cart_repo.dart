import 'package:e_commerece_app/features/cart/data/models/request_data.dart';
import 'package:e_commerece_app/features/cart/domain/entities/cart_enitites.dart';
import 'package:either_dart/either.dart';

abstract class BaseCartRepo{

  Future<Either<String,CartEntities>> getCart();
  Future<Either<String,UpdateDeleteCartEntities>> updateCart({required CarRequestData requestData});
  Future<Either<String,UpdateDeleteCartEntities>> delete({required CarRequestData requestData});
  Future<Either<String,String>> postCart({required CarRequestData requestData});

}