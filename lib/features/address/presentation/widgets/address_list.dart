import 'package:e_commerece_app/core/shared/my_shared.dart';
import 'package:e_commerece_app/core/shared/my_shared_keys.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/features/address/data/models/address_request.dart';
import 'package:e_commerece_app/features/address/presentation/manager/address_bloc.dart';
import 'package:e_commerece_app/features/address/presentation/manager/address_state.dart';
import 'package:e_commerece_app/features/address/presentation/widgets/manage_addresses_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddressList extends StatefulWidget {
  const AddressList({super.key, required this.bloc});
  final AddressBloc bloc;
  @override
  State<AddressList> createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressBloc, AddressState>(
      builder: (context, state) {
        if (state.getAddressRequestState == RequestState.loading) {
          return const Expanded(
              child: Center(child: CircularProgressIndicator()));
        }
        if (state.getAddressRequestState == RequestState.success &&
            state.getAddressDataEntities!.isNotEmpty) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.getAddressDataEntities!.length,
              itemBuilder: (context, index) => ManageAddressesWidget(
                markLocation: state.getAddressDataEntities![index].name,
                visibility: MyShared.getString(key: MySharedKeys.addressId) ==
                        state.getAddressDataEntities![index].id.toString()
                    ? true
                    : false,
                name: "${state.getAddressDataEntities![index].details},"
                    " ${state.getAddressDataEntities![index].region},"
                    " ${state.getAddressDataEntities![index].city}",
                note: state.getAddressDataEntities![index].notes,
                onItemSelected: () {
                  MyShared.putString(
                      key: MySharedKeys.addressId,
                      value:
                          state.getAddressDataEntities![index].id.toString());

                  state.getAddressDataEntities!.fold(true,
                      (previousValue, element) {
                    element.selected = false;
                    setState(() {});
                    return element.selected;
                  });
                  state.getAddressDataEntities![index].selected = true;
                  setState(() {});
                },
                onDelete: () {
                  widget.bloc.add(DeleteAddressEvent(
                    id: state.getAddressDataEntities![index].id.toString(),
                    index: index,
                  ));
                },
                onChange: () {
                  widget.bloc.add(PutAddressEvent(
                      addressRequest: AddressRequest(
                          name: 'Youssef',
                          city: 'cairo',
                          region: 'el shourokr',
                          details: 'carfoor',
                          notes: "come before 2 o'clock",
                          latitude: "3213",
                          longitude: "2323",
                          id: state.getAddressDataEntities![index].id),
                      index: index));
                },

              ),

            ),
          );


        }
        if (state.getAddressRequestState == RequestState.success &&
            state.getAddressDataEntities!.isEmpty) {
          return Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.sp),
                child: Text(
                  "You Have no Address",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      color: AppColors.grey),
                ),
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
