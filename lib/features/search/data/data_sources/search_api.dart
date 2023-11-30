import 'package:e_commerece_app/core/api/end_points.dart';
import 'package:e_commerece_app/core/api/my_dio.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/home/data/models/home_products_model.dart';

abstract class BaseSearchApi{

  Future<List<HomeProductsModel>> getSearch({required String title});
}

class SearchApi extends BaseSearchApi{
  @override
  Future<List<HomeProductsModel>> getSearch({required String  title}) async {
    final response = await AppDio.post(endPoint: EndPoints.search,data: {

      "text": title

    });
    safePrint(response!.data['data']['data']);
    if(response.data['status'] == true){
      return List<HomeProductsModel>
          .from((response.data['data']['data'] as List).map((e) =>
          HomeProductsModel.fromJson(e)

      ));
    } else{
      throw "";
    }
  }

}