part of 'product_details_bloc.dart';

class ProductDetailsState{
final ProductDetailsEntities? productDetailsEntities;
final RequestState requestState;
final String message;

ProductDetailsState(
    {
    this.productDetailsEntities,
    this.requestState = RequestState.initial,
    this.message = "",
  });

ProductDetailsState copyWith({
    final ProductDetailsEntities? productDetailsEntities,
    final RequestState? requestState,
    final String? message,
  }) {
    return ProductDetailsState(
      productDetailsEntities:
          productDetailsEntities ?? this.productDetailsEntities,
      requestState: requestState ?? this.requestState,
      message: message ?? this.message,
    );
  }
}