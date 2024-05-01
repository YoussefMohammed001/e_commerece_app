import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/shared/my_shared.dart';
import 'package:e_commerece_app/core/shared/my_shared_keys.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/easy_loading.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/features/address/data/models/address_request.dart';
import 'package:e_commerece_app/features/address/presentation/manager/address_bloc.dart';
import 'package:e_commerece_app/features/address/presentation/manager/address_state.dart';
import 'package:e_commerece_app/features/address/presentation/widgets/manage_addresses_widget.dart';
import 'package:e_commerece_app/features/profile/presentation/widgets/app_bar_profile_items_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ManageAddressesScreen extends StatefulWidget {
  const ManageAddressesScreen({super.key});

  @override
  State<ManageAddressesScreen> createState() => _ManageAddressesScreenState();
}

class _ManageAddressesScreenState extends State<ManageAddressesScreen> {
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
          }
          if (state.addToAddressRequestState == RequestState.failure) {
            showError("");
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
                    liftIcon: 'arrow',
                    onAdd: () async {
                      cubit.add(PostAddressEvent(
                          addressRequest: AddressRequest(
                              name: 'salah Mohamed jjj',
                              city: 'as',
                              region: 'asa',
                              details: 'future',
                              notes: 'as',
                              latitude: "3213",
                              longitude: "2323",
                              id: 0)));
                      // cubit..add(GetAddressEvent());
                    },
                  ),
                  Gap(3.h),
                  BlocBuilder<AddressBloc, AddressState>(
                    builder: (context, state) {
                      if (state.getAddressRequestState ==
                          RequestState.loading) {
                        return const Expanded(
                            child: Center(child: CircularProgressIndicator()));
                      }
                      if (state.getAddressRequestState ==
                          RequestState.success) {
                        return Expanded(
                          child: ListView.builder(
                            itemCount:
                                state.getAddressDataEntities!.reversed.length,
                            itemBuilder: (context, index) =>
                                ManageAddressesWidget(
                              markLocation:
                                  state.getAddressDataEntities![index].name,
                              visibility:MyShared.getString(key: MySharedKeys.addressId) == state.getAddressDataEntities![index].id.toString() ?true  : false,
                              name: "${state.getAddressDataEntities![index].details},"
                                      " ${state.getAddressDataEntities![index].region},"
                                      " ${state.getAddressDataEntities![index].city}",
                              note: state.getAddressDataEntities![index].notes,
                              onItemSelected: () {
                                MyShared.putString(key: MySharedKeys.addressId,

                                    value: state.getAddressDataEntities![index].id.toString());

                                state.getAddressDataEntities!.fold(true,
                                    (previousValue, element) {
                                  element.selected = false;
                                  setState(() {});
                                  return element.selected;
                                });
                                state.getAddressDataEntities![index].selected =
                                    true;
                                setState(() {});
                              },
                            ),
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
