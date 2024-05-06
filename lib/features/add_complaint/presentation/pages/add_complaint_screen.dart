import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/services/valid_email.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/easy_loading.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/widgets/app_button.dart';
import 'package:e_commerece_app/core/widgets/app_congrats.dart';
import 'package:e_commerece_app/core/widgets/app_text_form_field.dart';
import 'package:e_commerece_app/features/add_complaint/data/models/add_complaint_model.dart';
import 'package:e_commerece_app/features/add_complaint/presentation/manager/add_complaint_bloc.dart';
import 'package:e_commerece_app/features/profile/presentation/widgets/app_bar_profile_items_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddComplaintScreen extends StatefulWidget {
 const  AddComplaintScreen({super.key});

  @override
  State<AddComplaintScreen> createState() => _AddComplaintScreenState();
}

class _AddComplaintScreenState extends State<AddComplaintScreen> {
  final bloc = AddComplaintBloc(sl());

  final _formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController mobile = TextEditingController();

  TextEditingController message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,

      child: BlocListener<AddComplaintBloc, AddComplaintState>(
        listener: (context, state) {
          if(state.addComplaintRequestState == RequestState.loading){
            showLoading();
          }
          if(state.addComplaintRequestState == RequestState.success){
            hideLoading();
            pushAndRemoveUntil(context, AppCongrats(title: state.addComplaintMessage, icon: "check.png"));
          }
        },
        child: Form(
          key: _formKey,
          child: SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppBarProfileItemsWidget(
                          title: 'Send Complaint',
                          leftIcon: 'arrow',
                          iconVisibility: false,
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          "Add your complaint",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Text(
                          "be free to send use your complaint and you will reply to you as soon aas possible",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                              color: AppColors.dark),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        AppTextFormField(
                          validators: (value) {
                            if (value!.isEmpty) {
                              return "your name is required";
                            }
                            return null;
                          },
                          labelText: "Name",
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          controller: name,
                          prefixIcon: Icons.add,
                          isPass: false,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        AppTextFormField(
                            validators: (value) {
                              if (value!.isEmpty) {
                                return "your email is required";
                              }
                              if (!value.isValidEmail()) {
                                return "invalid email";
                              }
                              return null;
                            },
                            labelText: "Email",
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            controller: email,
                            prefixIcon: Icons.add,
                            isPass: false),
                        SizedBox(
                          height: 2.h,
                        ),
                        AppTextFormField(
                            validators: (value) {
                              if (value!.isEmpty) {
                                return "your mobile number is required";
                              }
                              if (value.length != 11) {
                                return "invalid mobile number";
                              }
                              return null;
                            },
                            labelText: "Mobile Number",
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.visiblePassword,
                            controller: mobile,
                            prefixIcon: Icons.add,
                            isPass: false),
                        SizedBox(
                          height: 2.h,
                        ),
                        AppTextFormField(
                            maxLines: 100,
                            minLines: 8,
                            validators: (value) {
                              if (value!.isEmpty) {
                                return "Please type your complaint";
                              }

                              return null;
                            },
                            labelText: "Complaint",

                            textInputAction: TextInputAction.none,
                            keyboardType: TextInputType.text,
                            controller: message,
                            prefixIcon: Icons.add,
                            isPass: false),
                        SizedBox(height: 2.h,),
                        AppButton(
                            borderRadius: BorderRadius.circular(13.sp),
                            bgColor: AppColors.primary,
                            margin: EdgeInsets.symmetric(
                              vertical: 13.sp,
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                bloc.add(AddComplaintEvent(
                                    addComplaintsModel: AddComplaintsModel(
                                      name: name.text,
                                      phone: mobile.text,
                                      email: email.text,
                                      message: message.text,
                                    )));
                              }
                            },
                            label: "Add Complaint")
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
