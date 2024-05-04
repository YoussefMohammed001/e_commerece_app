part of 'main_cubit.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class BackHomeState extends MainState {}

class SwitchToFavScreen extends MainState{}
class SwitchToCartScreen extends MainState{}
class SwitchToProfileScreen extends MainState{}

