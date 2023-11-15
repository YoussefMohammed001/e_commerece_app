part of 'favourite_bloc.dart';

class FavState   {
  final RequestState changeFavRequest;
  final String changeMessage;


  final List<BaseFavEntities> productDetailsEntities;
  final RequestState getFavRequest;

  FavState({this.changeFavRequest = RequestState.initial,
    this.changeMessage = '',
    this.productDetailsEntities = const [],
    this.getFavRequest = RequestState.loading});


  FavState copyWith({
    final RequestState? changeFavRequest,
    final  String? changeMessage,
    final  List<BaseFavEntities>? productDetailsEntities,
    final  RequestState? getFavRequest,
  }) {
    return FavState(
      changeFavRequest: changeFavRequest ?? this.changeFavRequest,
      changeMessage: changeMessage ?? this.changeMessage,
      productDetailsEntities:
      productDetailsEntities ?? this.productDetailsEntities,
      getFavRequest: getFavRequest ?? this.getFavRequest,
    );
  }


}
