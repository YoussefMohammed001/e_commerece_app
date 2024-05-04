import 'package:bloc/bloc.dart';
import 'package:e_commerece_app/core/api/end_points.dart';
import 'package:e_commerece_app/core/api/my_dio.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/terms_and_conditions/model/terms_and_conditions_model.dart';
import 'package:meta/meta.dart';

part 'terms_and_conditions_state.dart';

class TermsAndConditionsCubit extends Cubit<TermsAndConditionsState> {
  TermsAndConditionsCubit() : super(TermsAndConditionsInitial());
  TermsAndConditionsModel? termsAndConditionsModel;
  getTerms() async {
    safePrint("response");
    emit(TermsAndConditionsLoading());
    var response = await AppDio.get(endPoint: EndPoints.termsAndConditions);
    try{
      if(response!.data['status'] == true){
        termsAndConditionsModel = TermsAndConditionsModel.fromJson(response.data['data']);
        safePrint(termsAndConditionsModel!.about);
        safePrint(termsAndConditionsModel!.terms);
        emit(TermsAndConditionsSuccess());
      } else{
        safePrint(response);
      }
    } catch(e){

      safePrint(e);
      emit(TermsAndConditionsFailure(e.toString()));
    }
  }
}
