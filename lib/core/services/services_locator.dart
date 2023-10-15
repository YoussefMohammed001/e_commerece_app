import 'package:e_commerece_app/features/categories/data/data_sources/categories_remote_data_source.dart';
import 'package:e_commerece_app/features/categories/data/repositories/categories_repository.dart';
import 'package:e_commerece_app/features/categories/domain/repositories/base_home_repository.dart';
import 'package:e_commerece_app/features/categories/domain/use_cases/ategories_use_case.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
class ServicesLocator{
  void init (){

    ///UseCase
sl.registerLazySingleton(() => CategoriesUseCase(sl()));


    ///Repository
sl.registerLazySingleton<BaseCategoriesRepository>(() => CategoriesRepository(sl()));

    ///Data SOURCE
sl.registerLazySingleton<BaseCategoriesRemoteDataSource>(() => CategoriesRemoteDataSource());





  }
}