import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/features/address/domain/entities/address_entities.dart';

class  AddressState {
  
  final String addToAddressMessage;
  final RequestState addToAddressRequestState;
  final  AddressEntities? addAddressEntities;

  final String getAddressMessage;
  final RequestState getAddressRequestState;
  final List<AddressEntities>? getAddressDataEntities;


  final String updateMessage;
  final RequestState updateRequestState;
  final  AddressEntities? updateAddressEntities;


  final String deleteMessage;
  final RequestState deleteRequestState;

  const AddressState(
      {
        this.addAddressEntities,
        this.addToAddressMessage = "",
        this.addToAddressRequestState = RequestState.initial,
        this.getAddressMessage = "",
        this.getAddressRequestState = RequestState.initial,
        this.getAddressDataEntities,

        this.updateAddressEntities,
        this.updateMessage = "",
        this.updateRequestState  = RequestState.initial,


        this.deleteMessage = '',
        this.deleteRequestState  = RequestState.initial,
      });

  AddressState copyWith({
    final String? addToAddressMessage,
    final RequestState? addToAddressRequestState,
    final String? getAddressMessage,
    final RequestState? getAddressRequestState,
     final List<AddressEntities>? getAddressDataEntities,
    final String? updateMessage,
    final RequestState? updateRequestState,
    final AddressEntities? updateAddressEntities,

    final String? deleteMessage,
    final RequestState? deleteRequestState,
  }) {
    return AddressState(
      addToAddressMessage: addToAddressMessage ?? this.addToAddressMessage,
      addToAddressRequestState:  addToAddressRequestState ?? this.addToAddressRequestState,


      getAddressMessage: getAddressMessage ?? this.getAddressMessage,
      getAddressRequestState: getAddressRequestState ?? this.getAddressRequestState,
      getAddressDataEntities: getAddressDataEntities ?? this.getAddressDataEntities,

      updateMessage: updateMessage ?? this.updateMessage,
      updateRequestState: updateRequestState ?? this.updateRequestState,
       updateAddressEntities: updateAddressEntities ?? this.updateAddressEntities,


      deleteMessage: deleteMessage ?? this.deleteMessage,
      deleteRequestState: deleteRequestState ?? this.deleteRequestState,
    );
  }
}