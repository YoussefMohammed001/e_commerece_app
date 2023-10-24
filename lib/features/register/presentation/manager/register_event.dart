part of 'register_bloc.dart';

@immutable
abstract class BaseRegisterEvent {}
 class RegisterEvent extends BaseRegisterEvent{
 final RegisterData registerData;

 RegisterEvent({required this.registerData});
}
