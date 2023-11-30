import 'package:e_commerece_app/core/enitites/product_details_entities.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/search/domain/use_cases/search_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<BaseSearchEvent, SearchState> {
  final SearchUseCase searchUseCase;

  SearchBloc(this.searchUseCase) : super(SearchState()) {
    on<SearchEvent>((event, emit) async {
      final result = await searchUseCase.call(title: event.title);
      result.fold(
          (left) => emit(state.copyWith(requestState: RequestState.failure)),
          (right) {
            safePrint('right ===============> $right');
            emit(state.copyWith(
              requestState: RequestState.success,
              productDetailsEntities: right));
          });
    });
  }

}
