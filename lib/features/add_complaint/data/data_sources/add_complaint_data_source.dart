import 'package:e_commerece_app/core/api/end_points.dart';
import 'package:e_commerece_app/core/api/my_dio.dart';
import 'package:e_commerece_app/features/add_complaint/data/models/add_complaint_model.dart';

abstract class BaseAddComplaintDataSource{
  Future<String> addComplaint({required AddComplaintsModel addComplaintsModel});
}

class AddComplaintDataSource extends BaseAddComplaintDataSource {
  @override
  Future<String> addComplaint(
      {required AddComplaintsModel addComplaintsModel}) async {
    final response = await AppDio.post(endPoint: EndPoints.addComplaint,
        data: {
          "name": addComplaintsModel.name,
          "phone": addComplaintsModel.phone,
          "email": addComplaintsModel.email,
          "message":addComplaintsModel.message
        });
    if (response!.data['status'] == true) {
      return response.data['message'];
    } else {
      return response.data['message'];
    }
  }

}
