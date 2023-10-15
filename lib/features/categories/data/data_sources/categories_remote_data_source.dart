import 'package:e_commerece_app/core/api/end_points.dart';
import 'package:e_commerece_app/core/api/my_dio.dart';
import 'package:e_commerece_app/features/categories/data/models/categories_model.dart';

abstract class BaseCategoriesRemoteDataSource{
  Future<List<CategoriesModel>> getCategories({required int pageNumber});

}

class  CategoriesRemoteDataSource extends BaseCategoriesRemoteDataSource{
  @override
  Future<List<CategoriesModel>> getCategories({required int pageNumber}) async {
    final response = await AppDio.get(endPoint: EndPoints.categories,);
    if(response!.data['status'] == true){
      print(response);
      return List<CategoriesModel>
          .from((response.data['data']['data'] as List).map((e)
      => CategoriesModel.fromJson(e)
      ));
    } else{

    throw "";
    }
  }

}