import 'package:e_commerece_app/features/categories/domain/entities/categories.dart';
import 'package:either_dart/either.dart';

abstract class BaseCategoriesRepository {
  Future<Either<String , List<Categories>>>  getCategories({required int pageNumber});

}
