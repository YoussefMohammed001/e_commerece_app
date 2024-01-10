
// ignore: depend_on_referenced_packages
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
        getCartRequestState: RequestState.failure,

      ));
      }, (right) {
        safePrint("=========> right: $right");
        emit(state.copyWith(
            getCartRequestState: RequestState.success,
            getCartDataEntities: right
        ));
      });

    });


  }
}
