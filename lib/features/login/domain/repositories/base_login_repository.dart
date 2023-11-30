import 'package:e_commerece_app/core/enitites/UserDataEntities.dart';
import 'package:either_dart/either.dart';

abstract class BaseLoginRepository{
  Future<Either<String , UserDataEntities>>  login({required String email,required String password});
}