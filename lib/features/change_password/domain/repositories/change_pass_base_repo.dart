import 'package:either_dart/either.dart';

abstract class ChangePassBaseRepo{


  Future<Either<String,String>> changePass({required String pass});


}