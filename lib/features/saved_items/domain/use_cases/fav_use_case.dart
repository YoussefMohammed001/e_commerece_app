import 'package:e_commerece_app/features/saved_items/domain/entities/fav_entities.dart';
import 'package:e_commerece_app/features/saved_items/domain/repositories/base_favourite_repo.dart';
import 'package:either_dart/either.dart';

class FavUseCase{
  final BaseFavRepo baseFavRepo;
  FavUseCase(this.baseFavRepo);


  Future<Either<String,String>> callAddToFav({required String id}) async {
return await baseFavRepo.addToFav(id: id);
}



Future<Either<String,List<BaseFavEntities>>> callGetToFav() async {
    return await baseFavRepo.getToFav();

}

}