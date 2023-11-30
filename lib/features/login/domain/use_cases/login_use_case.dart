import 'package:e_commerece_app/core/enitites/UserDataEntities.dart';
import 'package:e_commerece_app/features/login/domain/repositories/base_login_repository.dart';
import 'package:either_dart/either.dart';

class LoginUseCase{
  BaseLoginRepository baseLoginRepository;
  LoginUseCase(this.baseLoginRepository);

  Future<Either<String , UserDataEntities>>  execute({required String email,required String password}) async {
    return await baseLoginRepository.login(email: email, password: password);
  }


}