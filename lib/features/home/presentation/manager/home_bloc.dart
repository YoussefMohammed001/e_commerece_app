import 'package:bloc/bloc.dart';
import 'package:e_commerece_app/core/enitites/product_details_entities.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/home/domain/entities/banners.dart';
import 'package:e_commerece_app/features/home/domain/entities/categories.dart';
import 'package:e_commerece_app/features/home/domain/use_cases/home_banners_use_case.dart';
import 'package:e_commerece_app/features/home/domain/use_cases/home_categories_use_case.dart';
import 'package:e_commerece_app/features/home/domain/use_cases/home_products_use_case.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeProductsUseCase homeProductsUseCase;
  final HomeBannersUseCase homeBannersUseCase;
  final HomeCategoriesUseCase homeCategoriesUseCase;
  HomeBloc(this.homeProductsUseCase, this.homeBannersUseCase, this.homeCategoriesUseCase) : super(HomeState()){
    on<HomeCategoriesEvent>(_getCategories);
    on<HomeBannersEvent>(_getBanners);
    on<HomeProductsEvent>(_getProducts);

  }

  Future<void> _getCategories(HomeCategoriesEvent event, Emitter<HomeState> emit) async {
    final result = await homeCategoriesUseCase.execute(pageNumber: 1);

    result.fold((left) {
      emit(state.copyWith(
        categoriesRequestState: RequestState.failure,
        categoriesMessage: '',
      ));
    }, (right) {
      safePrint("categories===========>$right");
      emit(state.copyWith(
        categoriesRequestState: RequestState.success,
        categories: right,
      ));
    });
  }

  Future<void> _getBanners(HomeBannersEvent event, Emitter<HomeState> emit) async {
    final result = await homeBannersUseCase.execute(pageNumber: 1);

    result.fold((left) {
      emit(state.copyWith(
        bannersRequestState: RequestState.failure,
        bannersMessage: '',
      ));
    }, (right) {
      safePrint("banners ===========>$right");

      emit(state.copyWith(
        bannersRequestState: RequestState.success,
        banners: right,
      ));
    });
  }

  Future<void> _getProducts(HomeProductsEvent event, Emitter<HomeState> emit) async {
    final result = await homeProductsUseCase.execute(pageNumber: 1);

    result.fold((left) {
      emit(state.copyWith(
        productsRequestState: RequestState.failure,
        productsMessage: '',
      ));
    }, (right) {
      safePrint("products ===========>$right");

      emit(state.copyWith(
        productsRequestState: RequestState.success,
        products: right,
      ));
    });
  }






}
