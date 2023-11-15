import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/categories/data/data_sources/categories_remote_data_source.dart';
import 'package:e_commerece_app/features/categories/domain/entities/categories.dart';
import 'package:e_commerece_app/features/categories/domain/repositories/base_home_repository.dart';
// ignore: implementation_imports
import 'package:either_dart/src/either.dart';

class CategoriesRepository extends BaseCategoriesRepository{
  final BaseCategoriesRemoteDataSource categoriesRemoteDataSource;

  CategoriesRepository(this.categoriesRemoteDataSource);

  @override
  Future<Either<String, List<Categories>>> getCategories({required int pageNumber}) async {
    final result = await categoriesRemoteDataSource.getCategories(pageNumber: pageNumber);
    safePrint("cat result $result");
    try{
      return Right(result);
    } catch (e){
      return const Left("value");
    }

  }

}