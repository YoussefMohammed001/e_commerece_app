import 'package:e_commerece_app/features/product_details/domain/entities/product_details_entities.dart';
import 'package:e_commerece_app/features/product_details/domain/repositories/base_product_details_repository.dart';
import 'package:either_dart/either.dart';

class ProductDetailsUseCase{
  BaseProductDetailsRepository baseProductDetailsRepository;
  ProductDetailsUseCase(this.baseProductDetailsRepository);
  Future<Either<String, ProductDetailsEntities>>  execute({required int id}) async {
    return await baseProductDetailsRepository.getProduct(id: id);
  }


}