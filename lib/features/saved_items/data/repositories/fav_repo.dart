import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/core/enitites/product_details_entities.dart';
import 'package:e_commerece_app/features/saved_items/data/data_sources/fav_data_source.dart';
import 'package:e_commerece_app/features/saved_items/domain/entities/fav_entities.dart';
import 'package:e_commerece_app/features/saved_items/domain/repositories/base_favourite_repo.dart';
import 'package:either_dart/either.dart';

class FavRepo extends BaseFavRepo{
  final BaseFavApi baseFavDataSource;

  FavRepo(this.baseFavDataSource);

  @override
  Future<Either<String, String>> addToFav({required String id}) async {
    final result = await baseFavDataSource.addFav(id: id);

    try{
      return Right(result);
    }catch (e){
      return Left(result);
    }
  }

  @override
  Future<Either<String, List<BaseFavEntities>>> getToFav() async {

    final result = await baseFavDataSource.getFav();
    safePrint("result=====>$result");
    try{
      return Right(result);
    }catch (e){
      return const Left("result");
    }

  }



}