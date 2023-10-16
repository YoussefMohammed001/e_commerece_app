

import 'package:e_commerece_app/features/home/domain/entities/banners.dart';
import 'package:e_commerece_app/features/home/domain/entities/categories.dart';
import 'package:e_commerece_app/features/home/domain/entities/products.dart';
import 'package:either_dart/either.dart';

abstract class BaseHomeRepository{
  Future<Either<String , List<HomeCategories>>>  getHomeCategories({required int pageNumber});
  Future<Either<String , List<Banners>>>  getHomeBanners({required int pageNumber});
  Future<Either<String , List<Products>>>  getHomeProducts({required int pageNumber});








}