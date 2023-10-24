import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/login/data/data_sources/login_remote_data_source.dart';
import 'package:e_commerece_app/features/login/domain/entities/login_entities.dart';
import 'package:e_commerece_app/features/login/domain/repositories/base_login_repository.dart';
import 'package:either_dart/src/either.dart';

class LoginRepository extends BaseLoginRepository{
  final BaseLoginRemoteDataSource baseLoginRemoteDataSource;

  LoginRepository(this.baseLoginRemoteDataSource);

  @override
  Future<Either<String, LoginEntities>> login({required String email,required String password}) async {
   final result = await baseLoginRemoteDataSource.login(email: email, password: password);
   safePrint("result=========================> ${result.data}");
   try{
     if (result.apiStatus == true) {
       return Right(result.data);
     } else {
       return Left(result.message);
     }
   }  catch (e){
     return  Left(result.message);
   }
  }

}
