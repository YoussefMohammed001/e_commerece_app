import 'package:e_commerece_app/features/product_details/domain/entities/product_details_entities.dart';
import 'package:either_dart/either.dart';

abstract class BaseProductDetailsRepository{
  Future<Either<String , ProductDetailsEntities>>  getProduct({required int id});

}