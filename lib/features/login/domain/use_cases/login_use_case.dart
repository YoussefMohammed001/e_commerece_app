import 'package:e_commerece_app/features/login/domain/entities/login_entities.dart';
import 'package:e_commerece_app/features/login/domain/repositories/base_login_repository.dart';
import 'package:either_dart/either.dart';

class LoginUseCase{
  BaseLoginRepository baseLoginRepository;
  LoginUseCase(this.baseLoginRepository);

  Future<Either<String , LoginEntities>>  execute({required String email,required String password}) async {
    return await baseLoginRepository.login(email: email, password: password);
  }


}