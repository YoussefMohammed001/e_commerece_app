import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/core/widgets/app_button.dart';
import 'package:e_commerece_app/features/cart/data/models/cart_data_request.dart';
import 'package:e_commerece_app/features/cart/presentation/manager/cart_bloc.dart';
import 'package:e_commerece_app/features/cart/presentation/widgets/cart_product_item.dart';
import 'package:e_commerece_app/features/orders/presentation/pages/confirm_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CartScreen extends StatefulWidget {
 const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cubit = CartBloc(sl());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit..add(GetCartEvent()),
      child: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {

          if (state.updateRequestState == RequestState.loading) {
            safePrint("loading update");

            showDialog(
              context: context,
              builder: (context) {
                return const Center(
                    child: CircularProgressIndicator());
              },
            );
          }

          if (state.updateRequestState == RequestState.success) {
            safePrint("loading success");
            pop(context);
          }

        },
        builder: (context, state) {
          if (state.getCartRequestState == RequestState.loading) {
            safePrint("loading");
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.primary,
            ));
          }
          else if (state.getCartRequestState == RequestState.success &&
              state.getCartDataEntities!.cartItemsList.isNotEmpty ) {
            return  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(10.sp),
                    child: Text("Cart",style:
                      TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.sp
                      ),),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount:
                          state.getCartDataEntities?.cartItemsList.length,
                      itemBuilder: (context, index) {
                        return CartItem(
                          /// K9W1RLLaEh1o3e7AzYdyXg2SjLGS9X3q1cVxgG7Wt1JMXnHibdelzO1I0TlGL6KBADXXnk
                            image: state
                                .getCartDataEntities!
                                .cartItemsList[index]
                                .productDetailsEntities
                                .image,
                            name: state
                                .getCartDataEntities!
                                .cartItemsList[index]
                                .productDetailsEntities
                                .name,
                            price: state
                                .getCartDataEntities!
                                .cartItemsList[index]
                                .productDetailsEntities
                                .price
                                .toString(),
                            oldPrice: state
                                .getCartDataEntities!
                                .cartItemsList[index]
                                .productDetailsEntities
                                .oldPrice
                                .toString(),
                            discount: state
                                .getCartDataEntities!
                                .cartItemsList[index]
                                .productDetailsEntities
                                .discount
                                .toInt(),
                            quantity: state.getCartDataEntities!
                                .cartItemsList[index].quantity,
                            delete: () {
                              cubit.add(DeleteCartEvent(CartDataRequest(
                                  id: state.getCartDataEntities!
                                      .cartItemsList[index].id),index));
                            },
                            inc: () {
                              int quantity = state.getCartDataEntities!
                                  .cartItemsList[index].quantity;

                              cubit.add(PutCartEvent(CartDataRequest(
                                id: state.getCartDataEntities!
                                    .cartItemsList[index].id,
                                quantity:  ++quantity,
                              ),index));

                            },
                            dec: () {
                              int quantity = state.getCartDataEntities!
                                  .cartItemsList[index].quantity;
                              safePrint(quantity);
                              safePrint(quantity--);
                              cubit.add(PutCartEvent(CartDataRequest(
                                id: state.getCartDataEntities!
                                    .cartItemsList[index].id,
                                quantity: quantity--,
                              ),index));
                            },
                            id: state.getCartDataEntities!
                                .cartItemsList[index].productDetailsEntities.id.toInt(),
                            minusVisible: state.getCartDataEntities!
                                        .cartItemsList[index].quantity >
                                    1
                                ? true
                                : false);
                      },
                    ),
                  ),
                  Container(
                    color: AppColors.primary.withOpacity(0.2),
                    padding: EdgeInsets.symmetric(horizontal: 13.sp,
                    vertical: 10.sp
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "sub total",
                          style: TextStyle(color: AppColors.primary),
                        ),
                        const Spacer(),
                        Container(
                            child: Text(

                                state.getCartDataEntities!.total.toString())),
                      ],
                    ),
                  ),
                  Container(
                    color: AppColors.primary.withOpacity(0.3),
                    padding: EdgeInsets.symmetric(horizontal: 13.sp,
                    vertical: 10.sp
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "VAT",
                          style: TextStyle(color: AppColors.primary),
                        ),
                        const Spacer(),
                        Container(
                            child: const Text(

                                "14 %")),
                      ],
                    ),
                  ),
                  Container(
                    color: AppColors.primary.withOpacity(0.2),
                    child: AppButton(
                      bgColor: AppColors.primary,
                        borderRadius: BorderRadius.circular(14.sp),
                        padding: EdgeInsets.all(12.sp),
                        margin: EdgeInsets.all(15.sp
                        ),
                        onPressed: (){
                        push(context, const ConfirmOrderScreen());
                    }, label: "Check Out"),
                  ),

                ],
            );
          }
          else if (state.getCartRequestState == RequestState.success &&
              state.getCartDataEntities!.cartItemsList.isEmpty) {
            return Container(
              alignment: AlignmentDirectional.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.remove_shopping_cart_outlined,
                    color: AppColors.primary,
                  size: 40.sp,
                  ),
                  SizedBox(height: 2.h,),
                  Text("No Items in Cart",style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 2.h,),

                ],
              ),
            );
          }
          else{
            return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ));
          }
        },
      ),
    );
  }
}
