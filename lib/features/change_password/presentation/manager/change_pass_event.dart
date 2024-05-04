part of 'change_pass_bloc.dart';

abstract class BaseLChangePassEvent {}

class EventChangePass extends BaseLChangePassEvent{
  final String cPass;
  final String pass;

  EventChangePass({required this.cPass, required this.pass});
}