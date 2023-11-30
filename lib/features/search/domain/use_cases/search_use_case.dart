import 'package:e_commerece_app/core/enitites/product_details_entities.dart';
import 'package:e_commerece_app/features/search/domain/repositories/base_search_repo.dart';
import 'package:either_dart/either.dart';

class SearchUseCase{
  final BaseSearchRepo baseSearchRepo;

  SearchUseCase(this.baseSearchRepo);


  Future<Either<String,List<ProductDetailsEntities>>> call({required String title}){
    return baseSearchRepo.getSearch(title: title);
  }

}