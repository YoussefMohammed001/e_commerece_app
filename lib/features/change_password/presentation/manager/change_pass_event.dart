part of 'change_pass_bloc.dart';

abstract class BaseLChangePassEvent {}

class EventChangePass extends BaseLChangePassEvent{
  final String pass;
  EventChangePass({required this.pass,});
}