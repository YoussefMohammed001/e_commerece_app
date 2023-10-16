part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {

  const HomeEvent();
}

class HomeBannersEvent extends HomeEvent{}
class HomeCategoriesEvent extends HomeEvent{}
class HomeProductsEvent extends HomeEvent{}
