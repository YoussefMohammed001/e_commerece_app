part of 'category_products_bloc.dart';

class CategoryProductsState {
  final List<CategoryProductsEntities> categoryProducts;
  final RequestState requestState;
  final String requestStateMessage;

  CategoryProductsState({
    this.categoryProducts = const  [],
    this.requestState = RequestState.initial,
    this.requestStateMessage = '',
  });

  CategoryProductsState copyWith({
    List<CategoryProductsEntities>? categoryProducts,
    RequestState? requestState,
    String? requestStateMessage,

  }){
    return CategoryProductsState(
      categoryProducts:  categoryProducts ?? this.categoryProducts,
      requestState:  requestState ?? this.requestState,
      requestStateMessage:  requestStateMessage ?? this.requestStateMessage,
    );


  }

}