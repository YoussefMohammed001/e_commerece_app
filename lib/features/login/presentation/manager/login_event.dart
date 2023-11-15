part of 'login_bloc.dart';

@immutable
abstract class BaseLoginEvent {}

class EventLogin extends BaseLoginEvent{
final String email;
final String password;

EventLogin({required this.email, required this.password});
}

