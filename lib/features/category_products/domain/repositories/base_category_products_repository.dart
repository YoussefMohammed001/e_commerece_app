import 'package:e_commerece_app/features/category_products/domain/entities/category_product.dart';
import 'package:either_dart/either.dart';

abstract class BaseCategoryProductsRepo{

  Future<Either<String , List<CategoryProductsEntities>>>  getCategoryProducts({required String id});


}