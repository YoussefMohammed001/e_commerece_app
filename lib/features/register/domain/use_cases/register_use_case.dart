import 'package:e_commerece_app/features/register/data/register_data.dart';
import 'package:e_commerece_app/features/register/domain/entities/register_entities.dart';
import 'package:e_commerece_app/features/register/domain/repositories/base_register_repo.dart';
import 'package:either_dart/either.dart';

class RegisterUseCase{
  final BaseRegisterRepo baseRegisterRepo;

  RegisterUseCase(this.baseRegisterRepo);


  Future<Either<String , BaseRegisterEntities>>  execute({required RegisterData registerData})async {
    return await baseRegisterRepo.register(registerData: registerData);
  }
}