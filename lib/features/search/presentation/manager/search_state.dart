part of 'search_bloc.dart';

class SearchState {
  final String message;
  final RequestState requestState;
  final List<ProductDetailsEntities> productDetailsEntities;

  SearchState({this.message = '', this.requestState = RequestState.loading, this.productDetailsEntities = const []});

  SearchState copyWith({
    final String? message,
    final RequestState? requestState,
    final List<ProductDetailsEntities>? productDetailsEntities,
  }) {
    return SearchState(
      message: message ?? this.message,
      requestState: requestState ?? this.requestState,
      productDetailsEntities:
          productDetailsEntities ?? this.productDetailsEntities,
    );
  }
}
