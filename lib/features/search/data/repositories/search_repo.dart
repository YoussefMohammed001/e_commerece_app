import 'package:e_commerece_app/core/enitites/product_details_entities.dart';
import 'package:e_commerece_app/features/search/data/data_sources/search_api.dart';
import 'package:e_commerece_app/features/search/domain/repositories/base_search_repo.dart';
import 'package:either_dart/src/either.dart';

class SearchRepo  extends BaseSearchRepo{
  final BaseSearchApi baseSearchApi;

  SearchRepo(this.baseSearchApi);

  @override
  Future<Either<String, List<ProductDetailsEntities>>> getSearch({required String title}) async {
    final result  = await baseSearchApi.getSearch(title: title);

    try{
      return Right(result);
    } catch (e){
      return Left("");
    }
  }

}