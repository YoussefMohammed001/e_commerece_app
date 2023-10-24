import 'package:e_commerece_app/features/product_details/data/data_sources/product_details_api.dart';
import 'package:e_commerece_app/features/product_details/domain/entities/product_details_entities.dart';
import 'package:e_commerece_app/features/product_details/domain/repositories/base_product_details_repository.dart';
import 'package:either_dart/src/either.dart';

class ProductDetailsRepo extends BaseProductDetailsRepository{
  final BaseProductDetailsApi productDetailsApi;


  ProductDetailsRepo(this.productDetailsApi);

  @override
  Future<Either<String, ProductDetailsEntities>> getProduct({required int id}) async {
    final result = await productDetailsApi.getProductDetails( id: id);
    try{
      return Right(result);
    } catch (e){
      return const Left("value");
    }
  }

}