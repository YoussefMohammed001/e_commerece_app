import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {

  final String statusMessage;
  final bool success;

const  ErrorMessageModel({

    required this.statusMessage,
    required this.success,
  });

  factory ErrorMessageModel.fromJson(Map<String,dynamic> json){
    return ErrorMessageModel(
        statusMessage: json['message'],
        success: json['status'],
    );
  }

  @override
  List<Object?> get props => [
    statusMessage,
    success,
  ];

}
