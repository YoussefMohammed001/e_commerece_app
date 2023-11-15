import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/category_products/data/data_sources/categories_products_data_source.dart';
import 'package:e_commerece_app/features/category_products/domain/entities/category_product.dart';
import 'package:e_commerece_app/features/category_products/domain/repositories/base_category_products_repository.dart';
import 'package:either_dart/src/either.dart';

class CategoryProductsRepo extends BaseCategoryProductsRepo{
  BaseCategoryProductsApi baseCategoryProductsApi;

  CategoryProductsRepo(this.baseCategoryProductsApi);

  @override
  Future<Either<String, List<CategoryProductsEntities>>> getCategoryProducts({required String id}) async {

    final result =await  baseCategoryProductsApi.getCategories(id: id);
safePrint("result================> $result");
     try{

       return Right(result);
    } catch (e){
       return Left(e.toString());
     }

  }








}