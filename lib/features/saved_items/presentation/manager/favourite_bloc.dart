import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/saved_items/domain/entities/fav_entities.dart';
import 'package:e_commerece_app/features/saved_items/domain/use_cases/fav_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<BaseFavouriteEvent, FavState> {
  final FavUseCase favUseCase;
  FavouriteBloc(this.favUseCase) : super(FavState()) {

on<EditFavEvent>(changeFav);

on<GetFavEvent>((event,emit) async{

      final result = await favUseCase.callGetToFav();
      result.fold((left) {
       emit(state.copyWith(
           getFavRequest: RequestState.failure

       ));
      }, (right) {
        print("right=======>$right");
        emit(state.copyWith(
          productDetailsEntities: right,
          getFavRequest: RequestState.success

        ));

      });

    });

  }


  Future<void> changeFav(EditFavEvent event, Emitter<FavState> emit) async {
   emit(state.copyWith(
       changeFavRequest: RequestState.loading,

   ));
   safePrint(state.changeFavRequest);

   final result = await favUseCase.callAddToFav(id: event.id);

    result.fold((left) {
      emit(state.copyWith(
          changeFavRequest: RequestState.failure,
          changeMessage: result.left
      ));
      safePrint(state.changeFavRequest);

    }, (right) {
      safePrint("right============> $right");
      emit(state.copyWith(
          changeFavRequest: RequestState.success,
          changeMessage: result.right
      ));
      safePrint(state.changeFavRequest);

    });


  }
}
