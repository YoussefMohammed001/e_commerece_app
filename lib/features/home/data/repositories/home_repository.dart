import 'package:e_commerece_app/core/enitites/product_details_entities.dart';
import 'package:e_commerece_app/features/home/data/data_sources/home_api.dart';
import 'package:e_commerece_app/features/home/domain/entities/banners.dart';
import 'package:e_commerece_app/features/home/domain/entities/categories.dart';
import 'package:e_commerece_app/features/home/domain/repositories/base_home_repository.dart';
import 'package:either_dart/src/either.dart';

class HomeRepository extends BaseHomeRepository{
  final BaseHomeApi baseHomeApi;
  HomeRepository(this.baseHomeApi);

  @override
  Future<Either<String, List<Banners>>> getHomeBanners({required int pageNumber}) async {
    final result = await baseHomeApi.getBanners(pageNumber: pageNumber);
    try{
      return Right(result);
    } catch (e){
      return const Left("value");
    }

  }

  @override
  Future<Either<String, List<HomeCategories>>> getHomeCategories({required int pageNumber}) async {
    final result = await baseHomeApi.getCategories(pageNumber: pageNumber);
    try{
      return Right(result);
    } catch (e){
      return const Left("value");
    }

  }

  @override
  Future<Either<String, List<ProductDetailsEntities>>> getHomeProducts({required int pageNumber}) async {
    final result = await baseHomeApi.getProducts(pageNumber: pageNumber);
    try{
      return Right(result);
    } catch (e){
      return const Left("value");
    }

  }

}