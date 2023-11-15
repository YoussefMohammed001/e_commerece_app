// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/features/category_products/domain/entities/category_product.dart';
import 'package:e_commerece_app/features/category_products/domain/use_cases/category_products_usecase.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
part 'category_products_event.dart';
part 'category_products_state.dart';

class CategoryProductsBloc extends Bloc<CategoryProductsEvent, CategoryProductsState> {
  final CategoryProductsUseCase categoryProductsUseCase;


  CategoryProductsBloc(this.categoryProductsUseCase) : super( CategoryProductsState()) {
    // ignore: invalid_use_of_visible_for_testing_member
    emit(
state.copyWith(
  requestState:  RequestState.loading
)
    );
    on<CategoryProductsEvent>((event, emit) async {
      final result = await categoryProductsUseCase.execute(id:event.id);
      result.fold((left) {
        emit(
            state.copyWith(
                requestState:  RequestState.failure
            )
        );
      }, (right) {
        emit(
            state.copyWith(
                requestState:  RequestState.success,
              categoryProducts: right
            )
        );

      });

    });
  }
}
