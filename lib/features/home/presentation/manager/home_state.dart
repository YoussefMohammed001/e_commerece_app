part of 'home_bloc.dart';

class HomeState{
  final List<HomeCategories> categories;
  final RequestState categoriesRequestState;
  final String categoriesMessage;

  final List<Banners> banners;
  final RequestState bannersRequestState;
  final String bannersMessage;

  final List<ProductDetailsEntities> products;
  final RequestState productsRequestState;
  final String productsMessage;

  HomeState({
    this.categories = const [],
    this.categoriesRequestState = RequestState.loading,
    this.categoriesMessage = '',
    this.banners = const [],
    this.bannersRequestState = RequestState.loading,
    this.bannersMessage = '',
    this.products = const [],
    this.productsRequestState = RequestState.loading,
    this.productsMessage = "",
  });

  HomeState copyWith({
    final List<HomeCategories>? categories,
    final RequestState? categoriesRequestState,
    final String? categoriesMessage,
    final List<Banners>? banners,
    final RequestState? bannersRequestState,
    final String? bannersMessage,
    final List<ProductDetailsEntities>? products,
    final RequestState? productsRequestState,
    final String? productsMessage,
  }) {
    return HomeState(
      categories: categories ?? this.categories,
      categoriesRequestState:
          categoriesRequestState ?? this.categoriesRequestState,
      categoriesMessage: categoriesMessage ?? this.categoriesMessage,
      banners: banners ?? this.banners,
      bannersRequestState: bannersRequestState ?? this.bannersRequestState,
      bannersMessage: bannersMessage ?? this.bannersMessage,
      products: products ?? this.products,
      productsRequestState: productsRequestState ?? this.productsRequestState,
      productsMessage: productsMessage ?? this.productsMessage,
    );
  }
}