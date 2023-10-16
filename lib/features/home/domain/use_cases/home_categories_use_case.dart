import 'package:e_commerece_app/features/home/domain/entities/categories.dart';
import 'package:e_commerece_app/features/home/domain/repositories/base_home_repository.dart';
import 'package:either_dart/either.dart';

class HomeCategoriesUseCase{
  final BaseHomeRepository baseHomeRepository;
  HomeCategoriesUseCase(this.baseHomeRepository);

  Future<Either<String , List<HomeCategories>>>  execute({required int pageNumber}) async {
    return await baseHomeRepository.getHomeCategories(pageNumber: pageNumber);
  }

}