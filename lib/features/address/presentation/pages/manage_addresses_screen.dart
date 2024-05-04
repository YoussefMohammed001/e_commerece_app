import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/easy_loading.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/address/data/models/address_request.dart';
import 'package:e_commerece_app/features/address/presentation/manager/address_bloc.dart';
import 'package:e_commerece_app/features/address/presentation/manager/address_state.dart';
import 'package:e_commerece_app/features/address/presentation/widgets/address_list.dart';
import 'package:e_commerece_app/features/profile/presentation/widgets/app_bar_profile_items_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ManageAddressesScreen extends StatelessWidget {
   ManageAddressesScreen({super.key});
  final cubit = AddressBloc(sl());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit..add(GetAddressEvent()),
      child: BlocListener<AddressBloc, AddressState>(
        listener: (context, state) {
          if (state.addToAddressRequestState == RequestState.loading) {
            showLoading();
          }

           if (state.addToAddressRequestState == RequestState.success) {
            showSuccess("Address Added!");
            safePrint("add success");
            // state.copyWith(
            //     addToAddressRequestState: RequestState.initial
            // );
          }
           if (state.addToAddressRequestState == RequestState.failure) {
             showError("add error");
          }

           if (state.deleteRequestState == RequestState.loading) {
            showLoading();
          }
           if (state.deleteRequestState == RequestState.success) {
            showSuccess("Address Deleted!");

          }
           if (state.deleteRequestState == RequestState.failure) {
             showError("delete error");
          }


           if (state.updateRequestState == RequestState.loading) {
            showLoading();
          }
           if (state.updateRequestState == RequestState.success) {
            showSuccess("Address Updated!");

          }
           if (state.updateRequestState == RequestState.failure) {
            showError("Updated error");

          }


        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.bg,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
              child: Column(
                children: [
                  AppBarProfileItemsWidget(
                    title: 'Manage Addresses',
                    rightIcon: 'add',
                    leftIcon: 'arrow',
                    onAdd: () async {
                      cubit.add(PostAddressEvent(
                          addressRequest: AddressRequest(
                              name: ' Mohamed jjj',
                              city: 'as',
                              region: 'asa',
                              details: 'future',
                              notes: 'as',
                              latitude: "3213",
                              longitude: "2323",
                              id: 0)));
                      },
                  ),
                  Gap(3.h),
                 AddressList(bloc: cubit,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
