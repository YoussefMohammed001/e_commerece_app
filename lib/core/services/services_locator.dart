import 'package:e_commerece_app/features/categories/data/data_sources/categories_remote_data_source.dart';
import 'package:e_commerece_app/features/categories/data/repositories/categories_repository.dart';
import 'package:e_commerece_app/features/categories/domain/repositories/base_home_repository.dart';
import 'package:e_commerece_app/features/categories/domain/use_cases/ategories_use_case.dart';
import 'package:e_commerece_app/features/home/data/data_sources/home_api.dart';
import 'package:e_commerece_app/features/home/data/repositories/home_repository.dart';
import 'package:e_commerece_app/features/home/domain/repositories/base_home_repository.dart';
import 'package:e_commerece_app/features/home/domain/use_cases/home_banners_use_case.dart';
import 'package:e_commerece_app/features/home/domain/use_cases/home_categories_use_case.dart';
import 'package:e_commerece_app/features/home/domain/use_cases/home_products_use_case.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
class ServicesLocator{
  void init (){

    ///UseCase
sl.registerLazySingleton(() => CategoriesUseCase(sl()));
sl.registerLazySingleton(() => HomeCategoriesUseCase(sl()));
sl.registerLazySingleton(() => HomeBannersUseCase(sl()));
sl.registerLazySingleton(() => HomeProductsUseCase(sl()));


    ///Repository
sl.registerLazySingleton<BaseCategoriesRepository>(() => CategoriesRepository(sl()));
sl.registerLazySingleton<BaseHomeRepository>(() => HomeRepository(sl()));

    ///Data SOURCE
sl.registerLazySingleton<BaseCategoriesRemoteDataSource>(() => CategoriesRemoteDataSource());
sl.registerLazySingleton<BaseHomeApi>(() => HomeApi());





  }
}