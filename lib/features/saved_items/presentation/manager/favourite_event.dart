part of 'favourite_bloc.dart';
@immutable
abstract class BaseFavouriteEvent {}

class EditFavEvent extends BaseFavouriteEvent{
  final String id;

  EditFavEvent(this.id);

}

class GetFavEvent extends BaseFavouriteEvent{

}



