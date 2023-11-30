part of 'update_profile_bloc.dart';

@immutable
abstract class BaseUpdateProfileEvent {}
class UpdateProfileEvent extends BaseUpdateProfileEvent{
final   RegisterData registerData;

UpdateProfileEvent(this.registerData);
}
