import 'package:e_commerece_app/core/enitites/UserDataEntities.dart';
import 'package:e_commerece_app/features/profile/data/data_sources/remote_daa_source.dart';
import 'package:e_commerece_app/features/profile/domain/repositories/base_profile_repo.dart';
import 'package:e_commerece_app/features/register/data/register_data.dart';
import 'package:either_dart/src/either.dart';

class ProfileRepo extends BaseProfileRepo{
final BaseProfileApi baseProfileApi;

ProfileRepo(this.baseProfileApi);

  @override
  Future<Either<String, UserDataEntities>> updateUser({required RegisterData registerData}) async {
    final result = await baseProfileApi.updateData(registerData: registerData);
    try{
      return Right(result.data);
    } catch (e){
      return Left(result.message);
    }
  }


}