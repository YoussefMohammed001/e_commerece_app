import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/product_details/domain/entities/product_details_entities.dart';
import 'package:e_commerece_app/features/product_details/domain/use_cases/product_details_use_case.dart';
import 'package:meta/meta.dart';
part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
final ProductDetailsUseCase productDetailsUseCase;


ProductDetailsBloc(this.productDetailsUseCase) : super(ProductDetailsState()){
on<ProductDetailsEvent>(_getProduct);
}

  Future<void> _getProduct(ProductDetailsEvent event,Emitter<ProductDetailsState> emit)async {
  emit(
    state.copyWith(
    requestState: RequestState.loading
    )
  );
     final result = await productDetailsUseCase.execute(id: event.id);

     result.fold(
             (l) => emit(state.copyWith(
           requestState: RequestState.failure,
           message: '',
         )),
             (r) {
           safePrint("product details ==============>$r");

           emit(
             state.copyWith(
               productDetailsEntities: r,
               requestState: RequestState.success,
             ),
           );
         }
     );




   }



}
