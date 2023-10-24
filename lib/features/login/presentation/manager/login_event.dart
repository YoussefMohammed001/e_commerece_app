part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class EventLogin extends LoginEvent{
final String email;
final String password;

EventLogin({required this.email, required this.password});
}

