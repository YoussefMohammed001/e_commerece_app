import 'package:e_commerece_app/features/register/data/register_data.dart';
import 'package:e_commerece_app/features/register/domain/entities/register_entities.dart';
import 'package:either_dart/either.dart';

abstract class BaseRegisterRepo{
  Future<Either<String , BaseRegisterEntities>>  register({required RegisterData registerData});

}