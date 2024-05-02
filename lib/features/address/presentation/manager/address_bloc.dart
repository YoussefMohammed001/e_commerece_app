import 'package:bloc/bloc.dart';
import 'package:e_commerece_app/core/shared/my_shared.dart';
import 'package:e_commerece_app/core/shared/my_shared_keys.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/address/data/models/address_request.dart';
import 'package:e_commerece_app/features/address/domain/entities/address_entities.dart';
import 'package:e_commerece_app/features/address/domain/use_cases/address_use_case.dart';
import 'package:e_commerece_app/features/address/presentation/manager/address_state.dart';
part 'address_event.dart';

class AddressBloc extends Bloc<BaseAddressEvent, AddressState> {
  AddressUseCase addressUseCase;
  AddressBloc(this.addressUseCase) : super( const AddressState()) {

    on<GetAddressEvent>((event, emit) async {
      emit(state.copyWith(
        getAddressRequestState: RequestState.loading
      ));
      final result = await addressUseCase.getAddress();
      result.fold((left) {
        safePrint("=========> left: $left");
        emit(state.copyWith(
          getAddressRequestState: RequestState.failure,));
      },
              (right) {
            emit(state.copyWith(
                getAddressRequestState: RequestState.success,
                getAddressDataEntities: right
            ));
            safePrint("=========> right: $right");

          });


    });


    on<PostAddressEvent>((event, emit) async {
      emit(state.copyWith(
        addToAddressRequestState: RequestState.loading,
        deleteRequestState: RequestState.initial,
        updateRequestState: RequestState.initial,

      ));
      final result = await addressUseCase.addAddress(addressRequest: event.addressRequest);
      result.fold((left) {
        safePrint("=========> left: $left");
        emit(state.copyWith(
          addToAddressRequestState: RequestState.failure,));
      },
              (right) {

                safePrint("=========> right: $right");
                safePrint("=========> right: ${right.region}");
                state.getAddressDataEntities!.add(right);

            emit(state.copyWith(
                addToAddressRequestState: RequestState.success,
                getAddressDataEntities: state.getAddressDataEntities
            ));

              });


    });

    on<PutAddressEvent>((event, emit) async {
      emit(state.copyWith(
          addToAddressRequestState: RequestState.initial,
        deleteRequestState: RequestState.initial,
        updateRequestState: RequestState.loading,
      ));

      final result = await addressUseCase.putAddress(addressRequest: event.addressRequest);
      result.fold((left) {
        safePrint("=========> left: $left");
        emit(state.copyWith(
          updateRequestState: RequestState.failure,

        ));
      },

              (right) {

        safePrint("update==========================> $right");
        emit(state.copyWith(
                updateRequestState: RequestState.success,
            ));

        state.getAddressDataEntities![event.index].name
        = right.name;

 state.getAddressDataEntities![event.index].city
        = right.city;
 state.getAddressDataEntities![event.index].region
        = right.region;
 state.getAddressDataEntities![event.index].details
        = right.details;
 state.getAddressDataEntities![event.index].notes
        = right.notes;
 state.getAddressDataEntities![event.index].latitude
        = right.latitude;
 state.getAddressDataEntities![event.index].longitude
        = right.longitude;

              });


    });





    on<DeleteAddressEvent>((event, emit) async {
      emit(state.copyWith(
        updateRequestState: RequestState.initial,
        addToAddressRequestState: RequestState.initial,
          deleteRequestState: RequestState.loading,


      ));
      final result = await addressUseCase.deleteAddress(id: event.id);
      result.fold((left) {
        safePrint("=========> left: $left");
        emit(state.copyWith(
          deleteRequestState: RequestState.failure,));
      },
              (right) {

        safePrint(right);
        state.getAddressDataEntities!.removeAt(event.index);
        emit(state.copyWith(
                deleteRequestState: RequestState.success,
              deleteMessage: state.deleteMessage
            ));

              });


    });

  }
}
