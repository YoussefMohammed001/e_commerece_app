part of 'cart_bloc.dart';

@immutable
class  CartState {
  final String postMessage;
  final RequestState postRequestState;


   final String updateMessage;
  final RequestState updateRequestState;
final UpdateDeleteCartEntities? updateDeleteCartEntities;

final String deleteMessage;
  final RequestState deleteRequestState;
final UpdateDeleteCartEntities? deleteCartEntities;

  final CartEntities? cartEntities;
  final RequestState getRequestState;


  final AddressEntities? addressEntities;
  final String addressMessage;
  final RequestState geAddressRequestState;
  final RequestState addAddressRequestState;
  final RequestState updateAddressRequestState;




  const CartState( {
    this.deleteMessage ='',
    this.deleteRequestState =RequestState.initial ,
    this.deleteCartEntities,
    this.addressEntities,
    this.addressMessage = '',
    this.geAddressRequestState = RequestState.loading,
    this.addAddressRequestState = RequestState.loading,
    this.updateAddressRequestState = RequestState.loading,
      this.updateDeleteCartEntities,
        this.postMessage = "",
      this.postRequestState = RequestState.initial,
      this.updateMessage = '',
      this.updateRequestState = RequestState.initial,
      this.cartEntities,
      this.getRequestState = RequestState.loading});

  CartState copyWith({
    final String? postMessage,
    final RequestState? postRequestState,
    final String? updateMessage,
    final RequestState? updateRequestState,
    final UpdateDeleteCartEntities? updateDeleteCartEntities,
    final String? deleteMessage,
    final RequestState? deleteRequestState,
    final UpdateDeleteCartEntities? deleteCartEntities,
    final CartEntities? cartEntities,
    final RequestState? getRequestState,
    final AddressEntities? addressEntities,
    final String? addressMessage,
    final RequestState? geAddressRequestState,
    final RequestState? addAddressRequestState,
    final RequestState? updateAddressRequestState,
  }) {
    return CartState(
      postMessage: postMessage ?? this.postMessage,
      postRequestState: postRequestState ?? this.postRequestState,
      updateMessage: updateMessage ?? this.updateMessage,
      updateRequestState: updateRequestState ?? this.updateRequestState,
      updateDeleteCartEntities:
          updateDeleteCartEntities ?? this.updateDeleteCartEntities,
      deleteMessage: deleteMessage ?? this.deleteMessage,
      deleteRequestState: deleteRequestState ?? this.deleteRequestState,
      deleteCartEntities: deleteCartEntities ?? this.deleteCartEntities,
      cartEntities: cartEntities ?? this.cartEntities,
      getRequestState: getRequestState ?? this.getRequestState,
      addressEntities: addressEntities ?? this.addressEntities,
      addressMessage: addressMessage ?? this.addressMessage,
      geAddressRequestState:
          geAddressRequestState ?? this.geAddressRequestState,
      addAddressRequestState:
          addAddressRequestState ?? this.addAddressRequestState,
      updateAddressRequestState:
      updateAddressRequestState ?? this.updateAddressRequestState,
    );
  }
}
