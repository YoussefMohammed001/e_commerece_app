import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/easy_loading.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/core/widgets/app_congrats.dart';
import 'package:e_commerece_app/core/widgets/app_image.dart';
import 'package:e_commerece_app/features/cart/domain/entities/get_cart_entities.dart';
import 'package:e_commerece_app/features/confirm_order/presentation/manager/add_order_bloc.dart';
import 'package:e_commerece_app/features/confirm_order/presentation/widgets/deliver_time.dart';
import 'package:e_commerece_app/features/confirm_order/presentation/widgets/payment.dart';
import 'package:e_commerece_app/features/confirm_order/presentation/widgets/priceing_details_widgets.dart';
import 'package:e_commerece_app/features/confirm_order/presentation/widgets/ship_to.dart';
import 'package:e_commerece_app/features/profile/presentation/widgets/app_bar_profile_items_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CheckOutScreen extends StatefulWidget {
  CheckOutScreen({
    super.key,
    required this.getCartDataEntities,
  });
  final GetCartDataEntities getCartDataEntities;

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final bloc = AddOrderBloc(sl());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocListener<AddOrderBloc, AddOrderState>(
  listener: (context, state) {

    if(state.requestState == RequestState.loading){
      safePrint(state.requestState.name);
      showLoading();
    }
    if(state.requestState == RequestState.success){
      safePrint(state.requestState.name);
      safePrint("success");
      hideLoading();
      pushReplacement(context,const AppCongrats(
          title: "Your Order has been confirmed successfully",
          icon: "check.png") );
    }else{
safePrint(state.requestState.name);
    }
  },
  child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.bg,
          toolbarHeight: 0,
        ),
        backgroundColor: AppColors.bg,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBarProfileItemsWidget(
                title: "Confirm Order",
                leftIcon: 'arrow',
                iconVisibility: false,
              ),
              const ShipTo(
                address: 'El shourok, cairo,egypt',
              ),
              const DeliveryTime(
                time: 'By monday next week',
              ),
              const PaymentWidget(),
              SizedBox(
                height: 4.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Products",
                      style: TextStyle(
                          fontSize: 19.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    "(",
                    style:
                        TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "${widget.getCartDataEntities.cartItemsList.length}",
                    style: TextStyle(
                        fontSize: 19.sp,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    ")",
                    style:
                        TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.getCartDataEntities.cartItemsList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 40.w,
                      margin: EdgeInsets.all(12.sp),
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.sp,
                        vertical: 10.sp,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13.sp),
                      ),
                      child: Column(
                        children: [
                          AppImage(
                            imageUrl: widget.getCartDataEntities.cartItemsList[index]
                                .productDetailsEntities.image,
                            width: 50.w,
                            height: 8.h,
                            topRightRadius: 13.sp,
                            fit: BoxFit.scaleDown,
                            topLeftRadius: 13.sp,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            maxLines: 1,
                            widget.getCartDataEntities.cartItemsList[index]
                                .productDetailsEntities.name,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: AppColors.dark,
                            ),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Text(
                            maxLines: 1,
                            "${widget.getCartDataEntities.cartItemsList[index].productDetailsEntities.price} EGP",
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.dark,
                            ),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "quantity: ",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: AppColors.grey,
                                ),
                              ),
                              Text(
                                "${widget.getCartDataEntities.cartItemsList[index].quantity}",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: AppColors.dark,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Divider(
                color: Colors.grey[200],
                thickness: 1,
                height: 1,
              ),
              SizedBox(
                height: 1.h,
              ),
              PricingDetailsWidget(
                totalQuantity: widget.getCartDataEntities.cartItemsList
                    .fold(
                        0,
                        (previousValue, element) =>
                            element.quantity + previousValue)
                    .toString(),
                subTotal: '${widget.getCartDataEntities.total} EGP',
                total:
                    "${((14 / 100 * widget.getCartDataEntities.total) + widget.getCartDataEntities.total).toStringAsFixed(2)} EGP",
                onPress: () {
                  bloc.add(AddOrderEvent());
                },
              ),
            ],
          ),
        ),
      ),
),
    );
  }
}
