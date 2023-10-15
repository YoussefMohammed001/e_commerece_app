import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/features/categories/domain/entities/categories.dart';
import 'package:e_commerece_app/features/categories/domain/use_cases/ategories_use_case.dart';
import 'package:meta/meta.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {

final CategoriesUseCase categoriesUseCase;

CategoriesBloc(this.categoriesUseCase) : super(CategoriesState()){
  on<CategoriesEvent>(_getCategories);
}
Future<void> _getCategories(CategoriesEvent event, Emitter<CategoriesState> emit) async {
  final result = await categoriesUseCase.execute(pageNumber: 1);

  result.fold((left) {
    emit(state.copyWith(
      requestState: RequestState.failure,
      requestStateMessage: '',
    ));
  }, (right) {
    print(" now playing ===========>$right");

    emit(state.copyWith(
      requestState: RequestState.success,
      categories: right,
    ));
  });
}



}
