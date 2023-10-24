import 'package:e_commerece_app/features/register/data/data_sources/remote_data_source/register_api.dart';
import 'package:e_commerece_app/features/register/data/register_data.dart';
import 'package:e_commerece_app/features/register/domain/entities/register_entities.dart';
import 'package:e_commerece_app/features/register/domain/repositories/base_register_repo.dart';
import 'package:either_dart/src/either.dart';

class RegisterRepo extends BaseRegisterRepo{
  final BaseRegisterApi baseRegisterApi;

  RegisterRepo(this.baseRegisterApi);

  @override
  Future<Either<String, BaseRegisterEntities>> register({required RegisterData registerData}) async {
  final result =  await baseRegisterApi.register(registerData);
  try{
    if (result.status == true) {
      return Right(result);
    } else {
      return Left(result.message);
    }
  }  catch (e){
    return  Left(result.message);
  }



  }

}