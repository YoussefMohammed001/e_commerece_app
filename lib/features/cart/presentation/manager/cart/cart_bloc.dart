import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/cart/data/address_data.dart';
import 'package:e_commerece_app/features/cart/data/models/request_data.dart';
import 'package:e_commerece_app/features/cart/domain/entities/address_entities.dart';
import 'package:e_commerece_app/features/cart/domain/entities/cart_enitites.dart';
import 'package:e_commerece_app/features/cart/domain/use_cases/address_use_case.dart';
import 'package:e_commerece_app/features/cart/domain/use_cases/cart_use_case.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<BaseCartEvent, CartState> {
  final CartUseCase cartUseCase;
  final AddressUseCase addressUseCase;

  CartBloc(this.cartUseCase, this.addressUseCase) : super(const CartState()) {
    on<GetCartEvent>((event, emit) async {
      final result = await cartUseCase.callGet();

      result.fold((left) => emit(state.copyWith(


      )), (right) {
        safePrint("=========> right: ${right.total}");
        emit(state.copyWith(
          getRequestState: RequestState.success,
        cartEntities: right
      ));
      });
    });
    on<PutCartEvent>((event, emit) async {

      final result = await cartUseCase.callUpdate(requestData: event.requestData);

      result.fold((left) => emit(state.copyWith(


      )), (right) {
        emit(state.copyWith(
          updateDeleteCartEntities: right,
            updateRequestState: RequestState.success,
           updateMessage: right.cartItems.quantity.toString(),
        ));
      });
    });
    on<PostCartEvent>((event, emit) async {
      final result = await cartUseCase.callPost(requestData: event.carRequestData);

      result.fold((left) => emit(state.copyWith(



      )), (right) {
        emit(state.copyWith(
            postRequestState: RequestState.success,
            postMessage: right
        ));
      safePrint('===> ${state.postMessage}');

      }


      );
    });
    on<DeleteCartEvent>((event,emit) async {
      final result = await cartUseCase.callDelete(requestData: event.requestData);

      result.fold((left) => emit(state.copyWith(
      )), (right) {
        emit(state.copyWith(
            postRequestState: RequestState.success,
            deleteMessage: right.total.toString(),
            deleteCartEntities: right,
        ));
        state.cartEntities!.total = right.total;
        safePrint('===> ${state.postMessage}');

      }


      );
    });

    on<GetAddressEvent>(_getAddress);
    on<AddAddressEvent>(_addAddress);
    on<UpdateAddressEvent>(_updateAddress);
  }
  Future<void> _getAddress(GetAddressEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(
        geAddressRequestState: RequestState.loading
    ));
    final result = await  addressUseCase.callGet();
    result.fold(
          (left) => "",
          (right) {

        emit(state.copyWith(
            addressEntities: right,
            geAddressRequestState: RequestState.success
        ));
        safePrint("details==========>${right.details}");
      },
    );



  }

  Future<void> _addAddress(AddAddressEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(
        addAddressRequestState: RequestState.loading
    ));
    final result = await  addressUseCase.callAdd(addressData: event.addressData);
    result.fold(
          (left) => "",
          (right) {
        emit(state.copyWith(
            addressEntities: right,
            addAddressRequestState: RequestState.success
        ));
      },
    );

  }


  Future<void> _updateAddress(UpdateAddressEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(
        updateAddressRequestState: RequestState.loading
    ));
    final result = await  addressUseCase.callUpdate(addressData: event.addressData);
    result.fold(
          (left) => "",
          (right) {
        emit(state.copyWith(
            addressEntities: right,
            updateAddressRequestState: RequestState.success
        ));
      },
    );

  }



}
