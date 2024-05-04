import 'package:e_commerece_app/features/add_complaint/data/models/add_complaint_model.dart';
import 'package:e_commerece_app/features/add_complaint/domain/repositories/base_add_complaint_repo.dart';
import 'package:either_dart/either.dart';

class AddComplaintUseCase{
  BaseAddComplaintRepo baseAddComplaintRepo;
  AddComplaintUseCase(this.baseAddComplaintRepo);

    Future<Either<String,String>> execute({required AddComplaintsModel addComplaintsModel}){
      return baseAddComplaintRepo.addComplaintRepo(addComplaintsModel: addComplaintsModel);
    }
}