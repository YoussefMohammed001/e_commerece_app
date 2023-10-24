import 'package:e_commerece_app/features/category_products/domain/entities/category_product.dart';
import 'package:e_commerece_app/features/category_products/domain/repositories/base_category_products_repository.dart';
import 'package:either_dart/either.dart';

class CategoryProductsUseCase{
  final BaseCategoryProductsRepo baseCategoryProductsRepo;

  CategoryProductsUseCase(this.baseCategoryProductsRepo);

  Future<Either<String , List<CategoryProductsEntities>>>  execute({required String id}) async {
    return await baseCategoryProductsRepo.getCategoryProducts(id: id);
  }

}