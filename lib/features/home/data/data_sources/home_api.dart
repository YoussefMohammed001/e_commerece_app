import 'package:e_commerece_app/core/api/end_points.dart';
import 'package:e_commerece_app/core/api/my_dio.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/home/data/models/home_banners_model.dart';
import 'package:e_commerece_app/features/home/data/models/home_categories_model.dart';
import 'package:e_commerece_app/features/home/data/models/home_products_model.dart';

abstract class BaseHomeApi{
  Future<List<HomeCategoriesModel>> getCategories({required int pageNumber});
  Future<List<HomeBannersModel>> getBanners({required int pageNumber});
  Future<List<HomeProductsModel>> getProducts({required int pageNumber});

}

class HomeApi extends BaseHomeApi{
  @override
  Future<List<HomeBannersModel>> getBanners({required int pageNumber}) async {
    final response = await AppDio.get(endPoint: EndPoints.banners);
    if(response!.data['status'] == true){
      print(response);
      return List<HomeBannersModel>
          .from((response.data['data'] as List).map((e)
      => HomeBannersModel.fromJson(e)
      ));
    } else{

      throw "";
    }

  }

  @override
  Future<List<HomeCategoriesModel>> getCategories({required int pageNumber}) async {
    final response = await AppDio.get(endPoint: EndPoints.categories);
    if(response!.data['status'] == true){
      safePrint(response);
      return List<HomeCategoriesModel>
          .from((response.data['data']['data'] as List).map((e) =>
          HomeCategoriesModel.fromJson(e)
      ));
    } else{
      throw "";
    }
  }

  @override
  Future<List<HomeProductsModel>> getProducts({required int pageNumber}) async {
    final response = await AppDio.get(endPoint: EndPoints.products);
    if(response!.data['status'] == true){
      safePrint(response);
      return List<HomeProductsModel>
          .from((response.data['data']['products'] as List).map((e) =>
          HomeProductsModel.fromJson(e)
      ));
    } else{
      throw "";
    }
  }

}