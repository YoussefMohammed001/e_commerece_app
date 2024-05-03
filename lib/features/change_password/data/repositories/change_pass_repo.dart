import 'package:e_commerece_app/features/change_password/data/data_sources/change_pass_data_source.dart';
import 'package:e_commerece_app/features/change_password/domain/repositories/change_pass_base_repo.dart';
import 'package:either_dart/src/either.dart';

class ChangePassRepo extends ChangePassBaseRepo{
  final BaseChangePassDataSource baseChangePassDataSource;

  ChangePassRepo(this.baseChangePassDataSource);

  @override
  Future<Either<String, String>> changePass({required String pass}) async {
    final result = await baseChangePassDataSource.changePassApi(pass: pass);
    try{
      return Right(result);
    } catch (e){
      return Left(e.toString());
    }

  }

}