
import 'package:e_commerece_app/core/api/error_message_model.dart';

class ServerException implements Exception{
final ErrorMessageModel errorMessageModel;

ServerException({required this.errorMessageModel});
}