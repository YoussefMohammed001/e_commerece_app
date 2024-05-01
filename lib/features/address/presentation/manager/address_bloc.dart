import 'package:bloc/bloc.dart';
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
            safePrint("=========> right: ${right}");

          });


    });


    on<PostAddressEvent>((event, emit) async {
      emit(state.copyWith(
          addToAddressRequestState: RequestState.loading
      ));
      final result = await addressUseCase.addAddress(addressRequest: event.addressRequest);
      result.fold((left) {
        safePrint("=========> left: $left");
        emit(state.copyWith(
          addToAddressRequestState: RequestState.failure,));
      },
              (right) {
                safePrint("=========> right: ${right}");
                safePrint("=========> right: ${right.region}");
                state.getAddressDataEntities!.add(right);

            emit(state.copyWith(
                addToAddressRequestState: RequestState.success,
              getAddressDataEntities: state.getAddressDataEntities
            ));

              });


    });

  }
}
