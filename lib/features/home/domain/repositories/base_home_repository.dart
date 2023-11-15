

import 'package:e_commerece_app/core/enitites/product_details_entities.dart';
import 'package:e_commerece_app/features/home/domain/entities/banners.dart';
import 'package:e_commerece_app/features/home/domain/entities/categories.dart';
import 'package:either_dart/either.dart';

abstract class BaseHomeRepository{
  Future<Either<String , List<HomeCategories>>>  getHomeCategories({required int pageNumber});
  Future<Either<String , List<Banners>>>  getHomeBanners({required int pageNumber});
  Future<Either<String , List<ProductDetailsEntities>>>  getHomeProducts({required int pageNumber});








}