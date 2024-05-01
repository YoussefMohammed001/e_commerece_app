import 'package:e_commerece_app/core/api/end_points.dart';
import 'package:e_commerece_app/core/api/my_dio.dart';
import 'package:e_commerece_app/features/address/data/models/address_model.dart';
import 'package:e_commerece_app/features/address/data/models/address_request.dart';

abstract class BaseAddressApi{
  Future<List<AddressModel>> getAddressApi();
  Future<AddressModel> addAddressApi({required AddressRequest addressRequest});
  Future<AddressModel> updateAddressApi({required AddressRequest addressRequest});
  Future<AddressModel> deleteAddressApi({required String id});

}

class AddressApi extends BaseAddressApi{

  @override
  Future<List<AddressModel>> getAddressApi() async {
    final response = await AppDio.get(endPoint: EndPoints.address);
    if(response!.data['status'] == true){
      return  List<AddressModel>
          .from((response.data['data']['data'] as List).map((e) =>
          AddressModel.fromJson(e)));
    } else{
      return response.data['message'];
    }

  }

  @override
  Future<AddressModel> addAddressApi({required AddressRequest addressRequest}) async {
  final response = await AppDio.post(endPoint: EndPoints.address,
  data: addressRequest.toJson()
  );
  if(response!.data['status'] == true){
    return AddressModel.fromJson(response.data['data']);
  } else{
    return response.data['message'];
  }

  }

  @override
  Future<AddressModel> deleteAddressApi({required String id}) async {

    final response = await AppDio.delete(endPoint: "${EndPoints.address}/${id}"

    );
    if(response!.data['status'] == true){
      return AddressModel.fromJson(response.data['data']['data']);
    } else{
      return response.data['message'];
    }

  }

  @override
  Future<AddressModel> updateAddressApi({required AddressRequest addressRequest}) async {
    final response = await AppDio.put(endPoint: "${EndPoints.address}/${addressRequest.id}",
        data: addressRequest.toJson()
    );
    if(response!.data['status'] == true){
      return AddressModel.fromJson(response.data['data']['data']);
    } else{
      return response.data['message'];
    }

  }

}