import 'package:e_commerece_app/core/enitites/product_details_entities.dart';
import 'package:either_dart/either.dart';

abstract class BaseProductDetailsRepository{
  Future<Either<String , ProductDetailsEntities>>  getProduct({required int id});

}