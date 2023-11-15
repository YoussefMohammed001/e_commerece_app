import 'package:e_commerece_app/core/api/my_dio.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/category_products/data/models/category_products_model.dart';

abstract class BaseCategoryProductsApi{

  Future<List<CategoryProductsModel>> getCategories({required String id});


}

class CategoryProductsApi extends BaseCategoryProductsApi{
  @override
  Future<List<CategoryProductsModel>> getCategories({required String id}) async {

    final response = await AppDio.get(endPoint: "categories/$id");
safePrint(response);
if(response!.data['status'] == true){
  return List<CategoryProductsModel>
      .from((response.data['data']['data'] as List).map((e) =>
      CategoryProductsModel.fromJson(e)));
} else{
  throw"";

}



  }

}