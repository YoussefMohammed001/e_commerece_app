import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/cart/data/models/cart_data_request.dart';
import 'package:e_commerece_app/features/cart/presentation/manager/cart_bloc.dart';
import 'package:e_commerece_app/features/cart/presentation/widgets/cart_address.dart';
import 'package:e_commerece_app/features/cart/presentation/widgets/cart_app_bar.dart';
import 'package:e_commerece_app/features/cart/presentation/widgets/cart_product_item.dart';
import 'package:e_commerece_app/features/cart/presentation/widgets/empty_cart.dart';
import 'package:e_commerece_app/features/cart/presentation/widgets/order_summary.dart';
import 'package:e_commerece_app/features/confirm_order/presentation/pages/confirmOrder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                return const Center(child: CircularProgressIndicator());
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
          } else if (state.getCartRequestState == RequestState.success &&
              state.getCartDataEntities!.cartItemsList.isNotEmpty) {
            return SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CartAppBar(),
                    const CartAddress(),
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
                                cubit.add(DeleteCartEvent(
                                    CartDataRequest(
                                        id: state.getCartDataEntities!
                                            .cartItemsList[index].id),
                                    index));
                              },
                              inc: () {
                                int quantity = state.getCartDataEntities!
                                    .cartItemsList[index].quantity;

                                cubit.add(PutCartEvent(
                                    CartDataRequest(
                                      id: state.getCartDataEntities!
                                          .cartItemsList[index].id,
                                      quantity: ++quantity,
                                    ),
                                    index));
                              },
                              dec: () {
                                int quantity = state.getCartDataEntities!
                                    .cartItemsList[index].quantity;
                                safePrint(quantity);
                                safePrint(quantity--);
                                cubit.add(PutCartEvent(
                                    CartDataRequest(
                                      id: state.getCartDataEntities!
                                          .cartItemsList[index].id,
                                      quantity: quantity--,
                                    ),
                                    index));
                              },
                              id: state
                                  .getCartDataEntities!
                                  .cartItemsList[index]
                                  .productDetailsEntities
                                  .id
                                  .toInt(),
                              minusVisible: state.getCartDataEntities!
                                          .cartItemsList[index].quantity >
                                      1
                                  ? true
                                  : false);
                        },
                      ),
                    ),
                    OrderSummary(

                      totalPrice: state.getCartDataEntities!.total.toInt(),
                      quantity: state.getCartDataEntities!.cartItemsList.fold(
                          0,
                          (previousValue, element) =>
                              element.quantity + previousValue),
                      pressCheckOut: () {
                        push(
                            context,
                            CheckOutScreen(getCartDataEntities: state.getCartDataEntities!, totalQuantity: '', totalPrice: '',
                            ));
                      },
                    )
                  ],
                ),
              ),
            );
          } else if (state.getCartRequestState == RequestState.success &&
              state.getCartDataEntities!.cartItemsList.isEmpty) {
            return const EmptyCart();
          } else {
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
