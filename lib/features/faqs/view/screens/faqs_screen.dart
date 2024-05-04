import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/features/faqs/manager/faqs_cubit.dart';
import 'package:e_commerece_app/features/profile/presentation/widgets/app_bar_profile_items_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
          backgroundColor: AppColors.bg,
          body: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
                child: const AppBarProfileItemsWidget(
                  title: 'FAQs',
                  rightIcon: 'add',
                  leftIcon: 'arrow',
                  iconVisibility: false,
                ),
              ),
              Expanded(
                child: BlocBuilder<FaqsCubit, FaqsState>(
                  builder: (context, state) {
                    if (state is FaqsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                        itemCount: cubit.faqsList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ExpansionTile(
                                shape: const CircleBorder(),
                                collapsedShape: const CircleBorder(),
                                enableFeedback: true,


                                title: Text(
                                  cubit.faqsList[index].q,
                                  style: const TextStyle(
                                    color: AppColors.dark,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                children: [
                                  Padding(
                                      padding:  EdgeInsets.all(10.sp),
                                      child: Text(cubit.faqsList[index].ans))
                                ],
                              ),
                              Divider(
                                color: AppColors.grey.withOpacity(0.2),

                              ),
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
