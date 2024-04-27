import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/widgets/app_button.dart';
import 'package:e_commerece_app/core/widgets/app_text_form_field.dart';
import 'package:e_commerece_app/features/login/presentation/pages/login_screen.dart';
import 'package:e_commerece_app/features/register/data/register_data.dart';
import 'package:e_commerece_app/features/register/presentation/manager/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {

  RegisterScreen({super.key});

  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final cubit = RegisterBloc(sl());
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
         if(state.requestState == RequestState.success){
           pushReplacement(context, LoginScreen());
           final snackBar = SnackBar(
             backgroundColor: Colors.green,
             content:  Center(child: Column(
               children: [
                 Text(state.message,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp),),
                 Text("Use your email & password to login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp),),

               ],
             )),


           );
           ScaffoldMessenger.of(context).showSnackBar(snackBar);
         }
         if(state.requestState == RequestState.failure){
           final snackBar = SnackBar(
             backgroundColor: Colors.red,
             content:  Center(child: Text(state.message,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp),)),

           );
           ScaffoldMessenger.of(context).showSnackBar(snackBar);
         }

        },
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            return SafeArea(
              child: Scaffold(
                body: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 17.sp,vertical: 13.sp),

                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        Text("Welcome Back",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold,
              
                          ),
                        ),
                        SizedBox(height: 3.h,),
                        Text("Register now to see our new products",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 21.sp,
                            fontWeight: FontWeight.bold,
              
                          ),
                        ),
                        SizedBox(height: 2.h,),
                        Form(
                          key: _formKey,
                          child: Padding(
                            padding: EdgeInsets.all(13.sp),
                            child: Column(
                              children: [
                                AppTextFormField(
                                  validators: (value) {
              
                                    if(value!.isEmpty){
                                      return "This field is required";
                                    }
                                    return null;
              
                                  },
                                  labelText: 'Ahmed Mohamed',
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.name,
                                  controller: nameController,
                                  prefixIcon: Icons.person_outline,
                                  isPass: false, label: 'UserName',
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
                                  labelText: 'example@email.com',
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.emailAddress,
                                  controller: emailController,
                                  prefixIcon: Icons.email_outlined,
                                  isPass: false, label: "Email",
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                AppTextFormField(
                                  validators: (value) {
                                    if(value!.isEmpty){
                                      return "This field is required";
                                    }
                                    if(value.length != 11){
                                      return "invalid mobile number";
                                    }
                                    return null;
                                  },
                                  labelText: '+201211920545',
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  controller: phoneController,
                                  prefixIcon: Icons.phone_outlined,
                                  isPass: false, label: 'Mobile Number',
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                AppTextFormField(
                                  validators: (value) {
                                    if(value!.isEmpty){
                                      return "This field is required";
                                    }
                                    if(value.length <= 6){
                                      return "Password must be more than 6 digits";
                                    }
                                    return null;
                                  },
                                  labelText: 'Password',
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: passController,
                                  prefixIcon: Icons.lock_outline,
                                  isPass: true, label: 'Password',
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                AppTextFormField(
                                  validators: (value) {
                                    if(value!.isEmpty){
                                      return "This field is required";
                                    }
                                    if(value.length <= 6){
                                      return "Password must be more than 6 digits";
                                    }
                                    if(passController.text != confirmPassController.text){
                                      return "password doesn't match";
                                    }
                                    return null;
                                  },
                                  labelText: 'Re-Password',
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: confirmPassController,
                                  prefixIcon: Icons.lock_outline,
                                  isPass: true, label: 'Re-Password',
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
                                   cubit.add(RegisterEvent(
                                       registerData: RegisterData(
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
                             SizedBox(height: 5.h,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Already have account?",
                                      style: TextStyle(fontSize: 16.sp),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        push(context, LoginScreen());
                                      },
                                      child: Text(
                                        " Login",
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
            );
          },
        ),
      ),
    );
  }
}
