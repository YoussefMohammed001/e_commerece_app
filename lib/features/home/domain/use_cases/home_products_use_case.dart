import 'package:e_commerece_app/core/enitites/product_details_entities.dart';
import 'package:e_commerece_app/features/home/domain/repositories/base_home_repository.dart';
import 'package:either_dart/either.dart';

class HomeProductsUseCase{
  final BaseHomeRepository baseHomeRepository;
  HomeProductsUseCase(this.baseHomeRepository);

  Future<Either<String , List<ProductDetailsEntities>>>  execute({required int pageNumber}) async {
    return await baseHomeRepository.getHomeProducts(pageNumber: pageNumber);
  }

}