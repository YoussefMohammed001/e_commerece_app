import 'package:bloc/bloc.dart';
import 'package:e_commerece_app/core/api/end_points.dart';
import 'package:e_commerece_app/core/api/my_dio.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/faqs/model/faqs_model.dart';
import 'package:meta/meta.dart';

part 'faqs_state.dart';

class FaqsCubit extends Cubit<FaqsState> {
  FaqsCubit() : super(FaqsInitial());
  List<FAQsModel> faqsList = [];


  getFaqs() async {
    emit(FaqsLoading());
    var response = await AppDio.get(endPoint: EndPoints.faqs);
try{
  if(response!.data['status'] == true){
    faqsList =List<FAQsModel>.from((response.data['data']['data'] as List).map((e) =>
        FAQsModel.fromJson(e)));
    safePrint(faqsList[0].ans);
    safePrint(faqsList.length);
    emit(FaqsSuccess());
  } 
} catch(e){
  safePrint(e);
  emit(FaqsFailure("$e"));
}
  }



}
