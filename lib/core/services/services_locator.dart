import 'package:e_commerece_app/features/categories/data/data_sources/categories_remote_data_source.dart';
import 'package:e_commerece_app/features/categories/data/repositories/categories_repository.dart';
import 'package:e_commerece_app/features/categories/domain/repositories/base_home_repository.dart';
import 'package:e_commerece_app/features/categories/domain/use_cases/ategories_use_case.dart';
import 'package:e_commerece_app/features/category_products/data/data_sources/categories_products_data_source.dart';
import 'package:e_commerece_app/features/category_products/data/repositories/category_products_repo.dart';
import 'package:e_commerece_app/features/category_products/domain/repositories/base_category_products_repository.dart';
import 'package:e_commerece_app/features/category_products/domain/use_cases/category_products_usecase.dart';
import 'package:e_commerece_app/features/home/data/data_sources/home_api.dart';
import 'package:e_commerece_app/features/home/data/repositories/home_repository.dart';
import 'package:e_commerece_app/features/home/domain/repositories/base_home_repository.dart';
import 'package:e_commerece_app/features/home/domain/use_cases/home_banners_use_case.dart';
import 'package:e_commerece_app/features/home/domain/use_cases/home_categories_use_case.dart';
import 'package:e_commerece_app/features/home/domain/use_cases/home_products_use_case.dart';
import 'package:e_commerece_app/features/login/data/data_sources/login_remote_data_source.dart';
import 'package:e_commerece_app/features/login/data/repositories/login_repository.dart';
import 'package:e_commerece_app/features/login/domain/repositories/base_login_repository.dart';
import 'package:e_commerece_app/features/login/domain/use_cases/login_use_case.dart';
import 'package:e_commerece_app/features/product_details/data/data_sources/product_details_api.dart';
import 'package:e_commerece_app/features/product_details/data/repositories/product_details_repo.dart';
import 'package:e_commerece_app/features/product_details/domain/repositories/base_product_details_repository.dart';
import 'package:e_commerece_app/features/product_details/domain/use_cases/product_details_use_case.dart';
import 'package:e_commerece_app/features/register/data/data_sources/remote_data_source/register_api.dart';
import 'package:e_commerece_app/features/register/data/repositories/register_repo.dart';
import 'package:e_commerece_app/features/register/domain/repositories/base_register_repo.dart';
import 'package:e_commerece_app/features/register/domain/use_cases/register_use_case.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
class ServicesLocator{
  void init (){

    ///UseCase
sl.registerLazySingleton(() => CategoriesUseCase(sl()));
sl.registerLazySingleton(() => HomeCategoriesUseCase(sl()));
sl.registerLazySingleton(() => HomeBannersUseCase(sl()));
sl.registerLazySingleton(() => HomeProductsUseCase(sl()));
sl.registerLazySingleton(() => LoginUseCase(sl()));
sl.registerLazySingleton(() => ProductDetailsUseCase(sl()));
sl.registerLazySingleton(() => CategoryProductsUseCase(sl()));
sl.registerLazySingleton(() => RegisterUseCase(sl()));


    ///Repository
sl.registerLazySingleton<BaseCategoriesRepository>(() => CategoriesRepository(sl()));
sl.registerLazySingleton<BaseHomeRepository>(() => HomeRepository(sl()));
sl.registerLazySingleton<BaseLoginRepository>(() => LoginRepository(sl()));
sl.registerLazySingleton<BaseProductDetailsRepository>(() => ProductDetailsRepo(sl()));
sl.registerLazySingleton<BaseCategoryProductsRepo>(() => CategoryProductsRepo(sl()));
sl.registerLazySingleton<BaseRegisterRepo>(() => RegisterRepo(sl()));


    ///Data SOURCE
sl.registerLazySingleton<BaseCategoriesRemoteDataSource>(() => CategoriesRemoteDataSource());
sl.registerLazySingleton<BaseHomeApi>(() => HomeApi());
sl.registerLazySingleton<BaseLoginRemoteDataSource>(() => LoginRemoteDataSource());
sl.registerLazySingleton<BaseProductDetailsApi>(() => ProductDetailsApi());
sl.registerLazySingleton<BaseCategoryProductsApi>(() => CategoryProductsApi());
sl.registerLazySingleton<BaseRegisterApi>(() => RegisterApi());






  }
}