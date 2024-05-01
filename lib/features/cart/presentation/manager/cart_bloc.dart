import 'package:bloc/bloc.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/cart/data/models/cart_data_request.dart';
import 'package:e_commerece_app/features/cart/domain/entities/get_cart_entities.dart';
import 'package:e_commerece_app/features/cart/domain/entities/update_or_delete_cart_entites.dart';
import 'package:e_commerece_app/features/cart/domain/use_cases/cart_use_case.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<BaseCartEvent, CartState> {
  final CartUseCase cartUseCase;
  CartBloc(this.cartUseCase) : super(const CartState()) {
    on<GetCartEvent>((event, emit) async {
      emit(state.copyWith(
        getCartRequestState: RequestState.loading,
      ));
      final result = await cartUseCase.getCart();
      result.fold((left) {
        safePrint("=========> left: $left");

        emit(state.copyWith(
        getCartRequestState: RequestState.failure,));
      },
              (right) {
        emit(state.copyWith(
            getCartRequestState: RequestState.success,
            getCartDataEntities: right
        ));
        safePrint("=========> right: ${right.total}");

      });


    });
on<PostCartEvent>((event, emit) async {
  emit(state.copyWith(
    addToCartRequestState: RequestState.loading,

  ));
  final result = await cartUseCase.addCart(cartDataRequest: event.carRequestData);
  result.fold((left) {
    safePrint("=========> left: $left");

    emit(state.copyWith(
      addToCartRequestState: RequestState.failure,));
  }, (right) {
    emit(state.copyWith(
        addToCartRequestState: RequestState.success,
        addToCartMessage: right
    ));
    safePrint("=========> right: $right");

  });

});


   on<PutCartEvent>((event, emit) async {
      emit(state.copyWith(
        updateRequestState: RequestState.loading,

      ));
      final result = await cartUseCase.updateCart(cartDataRequest: event.requestData);
      result.fold((left) {
        safePrint("=========> left: $left");

        emit(state.copyWith(
        updateRequestState: RequestState.failure,));
      }, (right) {


        safePrint("=========> right: $right");
         safePrint("=====>${state.getCartDataEntities!.cartItemsList[event.index].quantity}");
        state.getCartDataEntities!.cartItemsList[event.index].quantity = right.cartItems.quantity;
        safePrint("=====>${state.getCartDataEntities!.cartItemsList[event.index].quantity}");
       state.getCartDataEntities!.total = right.total;
        safePrint(right.total.toString());
        emit(state.copyWith(
            updateRequestState: RequestState.success,
            updateCartEntities: right,
            updateMessage: right.total.toString()
        ));

      });

    });

   on<DeleteCartEvent>((event, emit) async {
      emit(state.copyWith(
        updateRequestState: RequestState.loading,

      ));
      final result = await cartUseCase.deleteCart(cartDataRequest: event.requestData);
      result.fold((left) {
        safePrint("=========> left: $left");
        emit(state.copyWith(
          updateRequestState: RequestState.failure,));
      }, (right) {
        state.getCartDataEntities!.total =
            right.total;
        state.getCartDataEntities!.cartItemsList
            .removeAt(event.index);
        emit(state.copyWith(
            updateRequestState: RequestState.success,
            deleteCartEntities: right,
          deleteMessage: right.total.toString()
        ));
        safePrint("=========> right: $right");

      });

    });



  }
}
