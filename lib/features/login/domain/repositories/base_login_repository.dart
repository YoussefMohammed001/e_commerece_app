import 'package:e_commerece_app/features/login/domain/entities/login_entities.dart';
import 'package:either_dart/either.dart';

abstract class BaseLoginRepository{
  Future<Either<String , LoginEntities>>  login({required String email,required String password});
}