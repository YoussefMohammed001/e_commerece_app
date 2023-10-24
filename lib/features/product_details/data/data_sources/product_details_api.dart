import 'package:e_commerece_app/core/api/end_points.dart';
import 'package:e_commerece_app/core/api/my_dio.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/product_details/data/models/product_details_model.dart';

abstract class BaseProductDetailsApi{
  Future<ProductDetailsModel> getProductDetails({required int id});
}

class ProductDetailsApi extends BaseProductDetailsApi{
  @override
  Future<ProductDetailsModel> getProductDetails({required int id}) async {

    final response = await AppDio.get(endPoint: EndPoints.productsDetails+id.toString());
    if(response!.data['status'] == true){
      safePrint(response);
      return ProductDetailsModel.fromJson(response.data['data']);
    } else{
      throw "";
    }


  }

}