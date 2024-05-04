import 'package:e_commerece_app/features/add_complaint/data/data_sources/add_complaint_data_source.dart';
import 'package:e_commerece_app/features/add_complaint/data/models/add_complaint_model.dart';
import 'package:e_commerece_app/features/add_complaint/domain/repositories/base_add_complaint_repo.dart';
import 'package:either_dart/either.dart';

class AddComplaintRepo extends BaseAddComplaintRepo{
  BaseAddComplaintDataSource baseAddComplaintDataSource;

  AddComplaintRepo(this.baseAddComplaintDataSource);

  @override
  Future<Either<String, String>> addComplaintRepo({required AddComplaintsModel addComplaintsModel}) async {
    final result =await  baseAddComplaintDataSource.addComplaint(addComplaintsModel: addComplaintsModel);
    try{
      return Right(result);
    } catch (e){
      return Left(e.toString());
    }
  }
  
}