import 'package:either_dart/either.dart';

abstract class AddOrderBaseRepo{
  Future<Either<String,String>> addOrder();

}