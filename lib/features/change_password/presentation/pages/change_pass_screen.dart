import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/easy_loading.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/widgets/app_button.dart';
import 'package:e_commerece_app/core/widgets/app_congrats.dart';
import 'package:e_commerece_app/core/widgets/app_text_form_field.dart';
import 'package:e_commerece_app/features/change_password/presentation/manager/change_pass_bloc.dart';
import 'package:e_commerece_app/features/profile/presentation/widgets/app_bar_profile_items_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChangePassScreen extends StatefulWidget {
  const ChangePassScreen({super.key});

  @override
  State<ChangePassScreen> createState() => _ChangePassScreenState();
}

class _ChangePassScreenState extends State<ChangePassScreen> {
  final bloc = ChangePassBloc(sl());

  final _formKey = GlobalKey<FormState>();

  TextEditingController currentPass = TextEditingController();

  TextEditingController newPass = TextEditingController();

  TextEditingController confirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocListener<ChangePassBloc, ChangePassState>(
        listener: (context, state) {
          if (state.requestState == RequestState.loading) {
            showLoading();
          }
          if (state.requestState == RequestState.success) {
            hideLoading();
            pushReplacement(
                context,
                 AppCongrats(
                  title: state.message,
                  icon: "shield.png",
                ));
          }
        },
        child: Form(
          key: _formKey,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: AppColors.bg,
              body: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppBarProfileItemsWidget(
                      title: 'Change Password',
                      leftIcon: 'arrow',
                      iconVisibility: false,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "Change Password",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17.sp,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "Enter your current password and the new password to change your pasword",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: AppColors.grey),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    AppTextFormField(
                        validators: (value) {
                          if (value!.isEmpty) {
                            return "Current Password is required";
                          }
                          return null;
                        },
                        labelText: "Current Password",
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.visiblePassword,
                        controller: currentPass,
                        prefixIcon: Icons.add,
                        isPass: true),
                    SizedBox(
                      height: 2.h,
                    ),
                    AppTextFormField(
                        validators: (value) {
                          if (value!.isEmpty) {
                            return "Password is required";
                          }
                          if (value.length < 7) {
                            return "password length mut be more than 7 digits";
                          }
                          return null;
                        },
                        labelText: "New Password",
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.visiblePassword,
                        controller: newPass,
                        prefixIcon: Icons.add,
                        isPass: true),
                    SizedBox(
                      height: 2.h,
                    ),
                    AppTextFormField(
                        validators: (value) {
                          if (value!.isEmpty) {
                            return "Confirm your password";
                          }
                          if (confirmPass.text != newPass.text) {
                            return "Password doesn't match";
                          }
                          return null;
                        },
                        labelText: "Confirm New Password",
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.visiblePassword,
                        controller: confirmPass,
                        prefixIcon: Icons.add,
                        isPass: true),
                    const Spacer(),
                    AppButton(
                        borderRadius: BorderRadius.circular(14.sp),
                        margin: EdgeInsets.symmetric(
                          vertical: 13.sp,
                        ),
                        bgColor: AppColors.primary,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {

                              bloc.add(EventChangePass(
                                pass: newPass.text, cPass: currentPass.text,
                              ));
                          }
                        },
                        label: 'Change Password'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
