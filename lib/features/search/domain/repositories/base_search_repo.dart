import 'package:e_commerece_app/core/enitites/product_details_entities.dart';
import 'package:either_dart/either.dart';

abstract class BaseSearchRepo{

  Future<Either<String,List<ProductDetailsEntities>>> getSearch({required String title});
}