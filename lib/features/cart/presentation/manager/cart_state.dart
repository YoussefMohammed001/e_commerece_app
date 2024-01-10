part of 'cart_bloc.dart';


class  CartState {
  final String getCartMessage;
  final RequestState getCartRequestState;
  final GetCartDataEntities? getCartDataEntities;


  final String updateMessage;
  final RequestState updateRequestState;
  final UpdateOrDeleteCartEntities? updateCartEntities;


  final String deleteMessage;
  final RequestState deleteRequestState;
  final UpdateOrDeleteCartEntities? deleteCartEntities;

  const CartState(
      {this.getCartMessage = "",
      this.getCartRequestState = RequestState.initial,
      this.getCartDataEntities,
      this.updateMessage = "",
      this.updateRequestState  = RequestState.initial,
      this.updateCartEntities,
      this.deleteMessage = '',
      this.deleteRequestState  = RequestState.initial,
      this.deleteCartEntities});

  CartState copyWith({
    final String? getCartMessage,
    final RequestState? getCartRequestState,
    final GetCartDataEntities? getCartDataEntities,
    final String? updateMessage,
    final RequestState? updateRequestState,
    final UpdateOrDeleteCartEntities? updateCartEntities,
    final String? deleteMessage,
    final RequestState? deleteRequestState,
    final UpdateOrDeleteCartEntities? deleteCartEntities,
  }) {
    return CartState(
      getCartMessage: getCartMessage ?? this.getCartMessage,
      getCartRequestState: getCartRequestState ?? this.getCartRequestState,
      getCartDataEntities: getCartDataEntities ?? this.getCartDataEntities,
      updateMessage: updateMessage ?? this.updateMessage,
      updateRequestState: updateRequestState ?? this.updateRequestState,
      updateCartEntities: updateCartEntities ?? this.updateCartEntities,
      deleteMessage: deleteMessage ?? this.deleteMessage,
      deleteRequestState: deleteRequestState ?? this.deleteRequestState,
      deleteCartEntities: deleteCartEntities ?? this.deleteCartEntities,
    );
  }
}