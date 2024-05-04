
import 'package:e_commerece_app/features/add_complaint/data/data_sources/add_complaint_data_source.dart';
import 'package:e_commerece_app/features/add_complaint/data/repositories/add_complaint_Repo.dart';
import 'package:e_commerece_app/features/add_complaint/domain/repositories/base_add_complaint_repo.dart';
import 'package:e_commerece_app/features/add_complaint/domain/use_cases/add_complaint_use_case.dart';
import 'package:e_commerece_app/features/address/data/data_sources/address_api.dart';
import 'package:e_commerece_app/features/address/data/repositories/address_repo.dart';
import 'package:e_commerece_app/features/address/domain/repositories/base_address_repo.dart';
import 'package:e_commerece_app/features/address/domain/use_cases/address_use_case.dart';
import 'package:e_commerece_app/features/cart/data/data_sources/cart_api.dart';
import 'package:e_commerece_app/features/cart/data/repositories/cart_repo.dart';
import 'package:e_commerece_app/features/cart/domain/repositories/base_cart_repo.dart';
import 'package:e_commerece_app/features/cart/domain/use_cases/cart_use_case.dart';
import 'package:e_commerece_app/features/categories/data/data_sources/categories_remote_data_source.dart';
import 'package:e_commerece_app/features/categories/data/repositories/categories_repository.dart';
import 'package:e_commerece_app/features/categories/domain/repositories/base_home_repository.dart';
import 'package:e_commerece_app/features/categories/domain/use_cases/ategories_use_case.dart';
import 'package:e_commerece_app/features/category_products/data/data_sources/categories_products_data_source.dart';
import 'package:e_commerece_app/features/category_products/data/repositories/category_products_repo.dart';
import 'package:e_commerece_app/features/category_products/domain/repositories/base_category_products_repository.dart';
import 'package:e_commerece_app/features/category_products/domain/use_cases/category_products_usecase.dart';
import 'package:e_commerece_app/features/change_password/data/data_sources/change_pass_data_source.dart';
import 'package:e_commerece_app/features/change_password/data/repositories/change_pass_repo.dart';
import 'package:e_commerece_app/features/change_password/domain/repositories/change_pass_base_repo.dart';
import 'package:e_commerece_app/features/change_password/domain/use_cases/change_pass_use_case.dart';
import 'package:e_commerece_app/features/confirm_order/data/data_sources/add_order_data_source.dart';
import 'package:e_commerece_app/features/confirm_order/data/repositories/add_order_repo.dart';
import 'package:e_commerece_app/features/confirm_order/domain/repositories/add_order_base_repo.dart';
import 'package:e_commerece_app/features/confirm_order/domain/use_cases/add_order_use_case.dart';
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
import 'package:e_commerece_app/features/profile/data/data_sources/remote_daa_source.dart';
import 'package:e_commerece_app/features/profile/data/repositories/profile_repo.dart';
import 'package:e_commerece_app/features/profile/domain/repositories/base_profile_repo.dart';
import 'package:e_commerece_app/features/profile/domain/use_cases/update_profile_use_case.dart';
import 'package:e_commerece_app/features/register/data/data_sources/remote_data_source/register_api.dart';
import 'package:e_commerece_app/features/register/data/repositories/register_repo.dart';
import 'package:e_commerece_app/features/register/domain/repositories/base_register_repo.dart';
import 'package:e_commerece_app/features/register/domain/use_cases/register_use_case.dart';
import 'package:e_commerece_app/features/saved_items/data/data_sources/fav_data_source.dart';
import 'package:e_commerece_app/features/saved_items/data/repositories/fav_repo.dart';
import 'package:e_commerece_app/features/saved_items/domain/repositories/base_favourite_repo.dart';
import 'package:e_commerece_app/features/saved_items/domain/use_cases/fav_use_case.dart';
import 'package:e_commerece_app/features/search/data/data_sources/search_api.dart';
import 'package:e_commerece_app/features/search/data/repositories/search_repo.dart';
import 'package:e_commerece_app/features/search/domain/repositories/base_search_repo.dart';
import 'package:e_commerece_app/features/search/domain/use_cases/search_use_case.dart';
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
sl.registerLazySingleton(() => FavUseCase(sl()));
sl.registerLazySingleton(() => UpdateProfileUseCase(sl()));
sl.registerLazySingleton(() => SearchUseCase(sl()));
sl.registerLazySingleton(() => CartUseCase(sl()));
sl.registerLazySingleton(() => AddressUseCase(sl()));
sl.registerLazySingleton(() => ChangePassUseCase(sl()));
sl.registerLazySingleton(() => AddComplaintUseCase(sl()));
sl.registerLazySingleton(() => AddOrderUseCase(sl()));


    ///Repository
sl.registerLazySingleton<BaseCategoriesRepository>(() => CategoriesRepository(sl()));
sl.registerLazySingleton<BaseHomeRepository>(() => HomeRepository(sl()));
sl.registerLazySingleton<BaseLoginRepository>(() => LoginRepository(sl()));
sl.registerLazySingleton<BaseProductDetailsRepository>(() => ProductDetailsRepo(sl()));
sl.registerLazySingleton<BaseCategoryProductsRepo>(() => CategoryProductsRepo(sl()));
sl.registerLazySingleton<BaseRegisterRepo>(() => RegisterRepo(sl()));
sl.registerLazySingleton<BaseFavRepo>(() => FavRepo(sl()));
sl.registerLazySingleton<BaseProfileRepo>(() => ProfileRepo(sl()));
sl.registerLazySingleton<BaseSearchRepo>(() => SearchRepo(sl()));
sl.registerLazySingleton<BaseCartRepo>(() => CartRepo(sl()));
sl.registerLazySingleton<BaseAddressRepo>(() => AddressRepo(sl()));
sl.registerLazySingleton<ChangePassBaseRepo>(() => ChangePassRepo(sl()));
sl.registerLazySingleton<BaseAddComplaintRepo>(() => AddComplaintRepo(sl()));
sl.registerLazySingleton<AddOrderBaseRepo>(() => AddOrderRepo(sl()));


    ///Data SOURCE
sl.registerLazySingleton<BaseCategoriesRemoteDataSource>(() => CategoriesRemoteDataSource());
sl.registerLazySingleton<BaseHomeApi>(() => HomeApi());
sl.registerLazySingleton<BaseLoginRemoteDataSource>(() => LoginRemoteDataSource());
sl.registerLazySingleton<BaseProductDetailsApi>(() => ProductDetailsApi());
sl.registerLazySingleton<BaseCategoryProductsApi>(() => CategoryProductsApi());
sl.registerLazySingleton<BaseRegisterApi>(() => RegisterApi());
sl.registerLazySingleton<BaseFavApi>(() => FavDataSource());
sl.registerLazySingleton<BaseProfileApi>(() => UpdateProfileApi());
sl.registerLazySingleton<BaseSearchApi>(() => SearchApi());
sl.registerLazySingleton<BaseCartApi>(() => CartApi());
sl.registerLazySingleton<BaseAddressApi>(() => AddressApi());
sl.registerLazySingleton<BaseChangePassDataSource>(() => ChangePassDataSource());
sl.registerLazySingleton<BaseAddComplaintDataSource>(() => AddComplaintDataSource());
sl.registerLazySingleton<AddOrderBaseDataSource>(() => AddOrderDataSource());







  }
}