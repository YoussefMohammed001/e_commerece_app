import 'package:e_commerece_app/core/api/end_points.dart';
import 'package:e_commerece_app/core/api/my_dio.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/cart/data/address_data.dart';
import 'package:e_commerece_app/features/cart/data/models/address_model.dart';

abstract class BaseAddressApi{
  Future<List<AddressModel>> getAddress();
  Future<AddressModel> updateAddress({required AddressData addressData});
  Future<AddressModel> addAddress({required AddressData addressData});

}

class AddressApi extends BaseAddressApi{
  @override
  Future<AddressModel> addAddress({required AddressData addressData}) async {
    final response = await AppDio.post(endPoint: EndPoints.address,data: {
      "name": addressData.name,
      "city": addressData.city,
      "region": addressData.region,
      "details": addressData.details,
      "notes": addressData.notes,
      "latitude": 30.0616863,
      "longitude": 31.3260088,
    });
    if(response!.data['status'] == true){
      return AddressModel.fromJson(response.data['data']);
    } else{
      return AddressModel.fromJson(response.data['data']);
    }

  }

  @override
  Future<List<AddressModel>> getAddress() async {
    final response = await AppDio.get(endPoint: EndPoints.address);
    if(response!.data['status'] == true){
      safePrint(response);
      safePrint(response);
      return List<AddressModel>.from((response.data['data']['data'] as List).map((e) =>  AddressModel.fromJson(e)));
    } else{
     throw "";
    }
  }

  @override
  Future<AddressModel> updateAddress({required AddressData addressData}) async {
    final response = await AppDio.put(endPoint: "${EndPoints.address}/${addressData.id}",data: {
      "name": addressData.name,
      "city": addressData.city,
      "region": addressData.region,
      "details": addressData.details,
      "notes": addressData.notes,
      "latitude": 30.0616863,
      "longitude": 31.3260088,
    });
    safePrint(response);

    if(response!.data['status'] == true){
      safePrint(response);
      return AddressModel.fromJson(response.data['data']);
    } else{
      return AddressModel.fromJson(response.data['data']);
    }
  }

}