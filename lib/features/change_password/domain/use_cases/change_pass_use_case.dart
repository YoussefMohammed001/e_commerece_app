import 'package:e_commerece_app/features/change_password/domain/repositories/change_pass_base_repo.dart';
import 'package:either_dart/either.dart';

class ChangePassUseCase{
  ChangePassBaseRepo changePassBaseRepo;
  ChangePassUseCase(this.changePassBaseRepo);

  Future<Either<String,String>> executeChangePass({required String cPass, required String pass}) async {
    return await changePassBaseRepo.changePass(pass: pass, cPass: cPass);
  }


}