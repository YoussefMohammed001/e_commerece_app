import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/widgets/app_button.dart';
import 'package:e_commerece_app/core/widgets/app_text_form_field.dart';
import 'package:e_commerece_app/features/profile/presentation/manager/update_profile_bloc.dart';
import 'package:e_commerece_app/features/register/data/register_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UpdateProfileScreen extends StatefulWidget {
  UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  TextEditingController confirmPassController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProfileBloc(sl()),
      child: BlocBuilder<UpdateProfileBloc, UpdateState>(
        builder: (context, state) {
          return Scaffold(

            body: Column(children: [
              Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.all(13.sp),
                  child: Column(
                    children: [
                      AppTextFormField(
                        validators: (value) {
                          if (value!.isEmpty) {
                            return "This field is required";
                          }
                          return null;
                        },
                        labelText: 'Name',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        controller: nameController,
                        prefixIcon: Icons.person_outline,
                        isPass: false,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      AppTextFormField(
                        validators: (value) {
                          if (value!.isEmpty) {
                            return "This field is required";
                          }
                          return null;
                        },
                        labelText: 'Email',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        prefixIcon: Icons.email_outlined,
                        isPass: false,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      AppTextFormField(
                        validators: (value) {
                          if (value!.isEmpty) {
                            return "This field is required";
                          }
                          if (value.length != 11) {
                            return "invalid mobile number";
                          }
                          return null;
                        },
                        labelText: 'Phone',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        controller: phoneController,
                        prefixIcon: Icons.phone_outlined,
                        isPass: false,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),


                      state.requestState == RequestState.loading
                          ? Container(
                          margin: EdgeInsets.symmetric(vertical: 14.sp),
                          padding:
                          EdgeInsets.symmetric(vertical: 15.sp),
                          child: const CircularProgressIndicator(
                            color: AppColors.primary,
                          ))
                          : AppButton(
                        borderRadius: BorderRadius.circular(18.sp),
                        margin: EdgeInsets.symmetric(vertical: 14.sp),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            UpdateProfileBloc(sl()).add(UpdateProfileEvent(
                               RegisterData(
                                  email: emailController.text.trim(),
                                  password: passController.text,
                                  phone: phoneController.text,
                                  name: nameController.text.trim(),
                                )

                            ));
                          }
                        },
                        label: "Register",
                        bgColor: AppColors.primary,
                      ),

                    ],
                  ),
                ),
              )
            ],),
          );
        },
      ),
    );
  }
}
