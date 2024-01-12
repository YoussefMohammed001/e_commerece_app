import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/cart/presentation/manager/cart_bloc.dart';
import 'package:e_commerece_app/features/cart/presentation/widgets/cart_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(
        create: (context) =>
        CartBloc(sl())
          ..add(GetCartEvent()),
        child:  BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state.getCartRequestState == RequestState.loading) {
                safePrint("loading");
                return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ));
              }
            if(state.getCartRequestState == RequestState.success){
              return Scaffold(

                appBar: AppBar(
                  title: const Text("Cart",
                    style: TextStyle(
                      color: Colors.white,

                    ),
                  ),
                  iconTheme: const IconThemeData(color: Colors.white),
                  backgroundColor: AppColors.primary,
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.getCartDataEntities?.cartItemsList.length,
                        itemBuilder: (context, index) {
                          return CartItem(image: state.getCartDataEntities!.cartItemsList[index].productDetailsEntities.image,
                              name: state.getCartDataEntities!.cartItemsList[index].productDetailsEntities.name,
                              price: state.getCartDataEntities!.cartItemsList[index].productDetailsEntities.price.toString(),
                              oldPrice: state.getCartDataEntities!.cartItemsList[index].productDetailsEntities.oldPrice.toString(),
                              discount: state.getCartDataEntities!.cartItemsList[index].productDetailsEntities.discount.toInt(),
                              quantity: state.getCartDataEntities!.cartItemsList[index].quantity,
                              delete: () {
safePrint(state.getCartDataEntities!.total.toString());
                              },
                              inc: () {

                              },
                              dec: () {

                              },
                              id: 2,
                              minusVisible: state.getCartDataEntities!.cartItemsList[index].quantity > 1 ? true : false);
                        },),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(14.sp),
                      child: Row(
                        children: [
                          const Text("sub total",style: TextStyle(
                            color: AppColors.primary
                          ),),
                          const Spacer(),
                          Container(
                              color: Colors.grey[200],
                              child: Text(state.getCartDataEntities!.total.toString())),
                        ],
                      ),
                    ),
                  ],

                ),
              );
            } else{
              return const Text("data");
            }

              },
          ),


      );
  }
}

