
import 'package:e_commerece_app/core/enitites/UserDataEntities.dart';
import 'package:e_commerece_app/features/register/data/register_data.dart';
import 'package:either_dart/either.dart';

abstract class BaseProfileRepo{

  Future<Either<String,UserDataEntities>> updateUser({required RegisterData registerData});
}