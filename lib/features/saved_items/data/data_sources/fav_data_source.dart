import 'package:e_commerece_app/core/api/end_points.dart';
import 'package:e_commerece_app/core/api/my_dio.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/saved_items/data/model/fav_model.dart';

abstract class BaseFavApi{
  Future<List<BaseFavModel>> getFav();
  Future<String> addFav({required String id});

}

class FavDataSource extends BaseFavApi{
  @override
  Future<String> addFav({required String id}) async {

    final response = await AppDio.post(endPoint: EndPoints.fav,data: {
      "product_id" :id,
    });
safePrint(response);
    if(response!.data['status'] == true){
      safePrint(response);

      return response.data['message'];
    } else{
      safePrint(response);

      return response.data['message'];
    }



  }


  @override
  Future<List<BaseFavModel>> getFav() async {
    final response  = await AppDio.get(endPoint: EndPoints.fav);

    if(response!.data['status'] == true){
      safePrint("data ====> ${response.data['data']['data']}");
      return List<BaseFavModel>
          .from((response.data['data']['data'] as List).map((e) =>
          BaseFavModel.fromJson(e)));
    } else{
      throw "";
    }

  }




}