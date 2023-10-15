part of 'categories_bloc.dart';

class CategoriesState {
  final List<Categories> categories;
  final RequestState requestState;
  final String requestStateMessage;

  CategoriesState({
    this.categories =  const [],
    this.requestState = RequestState.loading,
    this.requestStateMessage = '',
  });

  CategoriesState copyWith({
     List<Categories>? categories,
     RequestState? requestState,
     String? requestStateMessage,

}){
    return CategoriesState(
      categories:  categories ?? this.categories,
      requestState:  requestState ?? this.requestState,
      requestStateMessage:  requestStateMessage ?? this.requestStateMessage,
    );


}

}
