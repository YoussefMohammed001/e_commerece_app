import 'package:e_commerece_app/features/add_complaint/data/models/add_complaint_model.dart';
import 'package:either_dart/either.dart';

abstract class BaseAddComplaintRepo{

  Future<Either<String,String>> addComplaintRepo({required AddComplaintsModel addComplaintsModel});


}