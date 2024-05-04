import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/features/profile/presentation/widgets/app_bar_profile_items_widget.dart';
import 'package:e_commerece_app/features/terms_and_conditions/terms_and_conditions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  TermsAndConditionsScreen({
    super.key,
  });

  final cubit = TermsAndConditionsCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit..getTerms(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.bg,
          body: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
                child: const AppBarProfileItemsWidget(
                  title: 'Terms and Conditions',
                  rightIcon: 'add',
                  leftIcon: 'arrow',
                  iconVisibility: false,
                ),
              ),
              BlocBuilder<TermsAndConditionsCubit, TermsAndConditionsState>(
                builder: (context, state) {
                  if (state is TermsAndConditionsSuccess) {
                    return Padding(
                      padding: EdgeInsets.all(15.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Our Conditions",
                            style: TextStyle(
                              color: AppColors.dark,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(cubit.termsAndConditionsModel!.about,
                            style: const TextStyle(
                              color: AppColors.grey,
                              fontWeight: FontWeight.w400,

                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            "Our Terms",
                            style: TextStyle(
                              color: AppColors.dark,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(cubit.termsAndConditionsModel!.terms,
                            style: const TextStyle(
                              color: AppColors.grey,
                              fontWeight: FontWeight.w400,

                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
