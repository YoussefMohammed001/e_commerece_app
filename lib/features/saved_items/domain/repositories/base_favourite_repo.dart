import 'package:e_commerece_app/features/saved_items/domain/entities/fav_entities.dart';
import 'package:either_dart/either.dart';

abstract class BaseFavRepo{
   Future<Either<String,String>> addToFav({required String id});
   Future<Either<String,List<BaseFavEntities>>> getToFav();

}