import 'package:e_commerece_app/features/categories/domain/entities/categories.dart';
import 'package:e_commerece_app/features/categories/domain/repositories/base_home_repository.dart';
import 'package:either_dart/either.dart';

class CategoriesUseCase{
  final BaseCategoriesRepository baseCategoriesRepository;
  CategoriesUseCase(this.baseCategoriesRepository);

  Future<Either<String , List<Categories>>>  execute({required int pageNumber}) async {
    return await baseCategoriesRepository.getCategories(pageNumber: pageNumber);
  }

}