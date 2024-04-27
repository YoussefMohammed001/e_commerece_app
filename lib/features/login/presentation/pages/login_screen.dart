import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/widgets/app_button.dart';
import 'package:e_commerece_app/core/widgets/app_text_form_field.dart';
import 'package:e_commerece_app/features/login/presentation/manager/login_bloc.dart';
import 'package:e_commerece_app/features/main_screen/main_screen.dart';
import 'package:e_commerece_app/features/register/presentation/pages/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  final cubit = LoginBloc(sl());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => cubit,
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.requestState == RequestState.success) {
              pushAndRemoveUntil(context, const MainScreen());
            }
            if (state.requestState == RequestState.failure) {

              final snackBar = SnackBar(
                backgroundColor: Colors.red,
                content:  Center(child: Text(state.message,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp),)),

              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return Container(
                color: Colors.white,
                child: SafeArea(
                  child: Scaffold(
                    body: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 17.sp,vertical: 13.sp),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Welcome Back",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold,

                            ),
                            ),
                            SizedBox(height: 3.h,),
                            Text("Login now to see our new products",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 21.sp,
                              fontWeight: FontWeight.bold,

                            ),
                            ),
                            SizedBox(height: 14.h,),
                            Form(
                              key: _formKey,
                              child: Padding(
                                padding:  EdgeInsets.all(13.sp),
                                child: Column(
                                  children: [
                                    AppTextFormField(
                                      validators: (value) {
                                        if(value!.isEmpty){
                                          return "This field is required";
                                        }
                                        return null;
                                      },
                                      labelText: 'Email',
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.emailAddress,
                                      controller: emailController,
                                      prefixIcon: Icons.email_outlined,
                                      isPass: false, label: 'Email',
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    AppTextFormField(
                                      validators: (value) {
                                        if(value!.isEmpty){
                                          return "This field is required";
                                        }
                                        return null;
                                      },
                                      labelText: 'Password',
                                      textInputAction: TextInputAction.done,
                                      keyboardType: TextInputType.visiblePassword,
                                      controller: passController,
                                      prefixIcon: Icons.lock_outline,
                                      isPass: true, label: 'Password',
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Container(
                                      alignment: AlignmentDirectional.centerEnd,
                                      child: Text(
                                        "Forget Password",
                                        style: TextStyle(fontSize: 16.sp,
                                        color: AppColors.primary,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
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
                                      if(_formKey.currentState!.validate()){
                                        cubit.add(EventLogin(
                                          email: emailController.text,
                                          password: passController.text,
                                        ));

                                      }
                                      },
                                      label: "Login",
                                      bgColor: AppColors.primary,
                                    ),
                                    SizedBox(height: 16.h,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Don't have account?",
                                          style: TextStyle(fontSize: 16.sp),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            push(context, RegisterScreen());
                                          },
                                          child: Text(
                                            " Register",
                                            style: TextStyle(
                                                color: AppColors.primary,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.sp),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
