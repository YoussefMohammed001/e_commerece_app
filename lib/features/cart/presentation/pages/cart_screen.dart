import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/cart/presentation/manager/cart_bloc.dart';
import 'package:e_commerece_app/features/cart/presentation/widgets/cart_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(
        create: (context) =>
        CartBloc(sl())
          ..add(GetCartEvent()),
        child: Scaffold(
              body: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state.getCartRequestState == RequestState.loading) {
                safePrint("loading");
                return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ));
              }else{
                if(state.getCartDataEntities?.cartItemsList.length == 0){
                  return Text("data");
                }else{
                 return ListView.builder(
                    itemCount: state.getCartDataEntities?.cartItemsList.length,
                    itemBuilder: (context, index) {
                      return CartItem(image: "",
                          name: state.getCartDataEntities!.cartItemsList[index].productDetailsEntities.name,
                          price: "3",
                          oldPrice: "3",
                          discount: 3,
                          quantity: 3,
                          delete: () {},
                          inc: () {},
                          dec: () {},
                          id: 2,
                          minusVisible: false);
                    },);
                }

              }

              },
          ),
        ),
      );
  }
}

