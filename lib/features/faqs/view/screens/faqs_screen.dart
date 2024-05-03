import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/features/faqs/manager/faqs_cubit.dart';
import 'package:e_commerece_app/features/profile/presentation/widgets/app_bar_profile_items_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FAQsScreen extends StatelessWidget {
  FAQsScreen({super.key});

  final cubit = FaqsCubit();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit..getFaqs(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor:  AppColors.bg,
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 15.sp, vertical: 15.sp),
                child: const AppBarProfileItemsWidget(
                  title: 'FAQs',
                  rightIcon: 'add',
                  liftIcon: 'arrow',
                  iconVisibility: false,

                ),
              ),

              Expanded(
                child: BlocBuilder<FaqsCubit, FaqsState>(
                  builder: (context, state) {
                   if(state is FaqsLoading){
                     return Center(child: CircularProgressIndicator());
                   } else{
                     return ListView.builder(
                       itemCount: cubit.faqsList.length,
                       itemBuilder: (context, index) {
                         return ExpansionTile(
                           title: Text(cubit.faqsList[index].q),
                           children: [
                             Text(cubit.faqsList[index].ans)
                           ],
                         );
                       },
                     );
                   }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
