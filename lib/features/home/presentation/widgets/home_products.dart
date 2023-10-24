import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/widgets/product_item.dart';
import 'package:e_commerece_app/features/home/domain/entities/products.dart';
import 'package:e_commerece_app/features/home/presentation/manager/home_bloc.dart';
import 'package:e_commerece_app/features/product_details/presentation/pages/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeProducts extends StatefulWidget {
   HomeProducts({super.key});


  @override
  State<HomeProducts> createState() => _HomeProductsState();
}

class _HomeProductsState extends State<HomeProducts> {
  List<Products> products = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc,HomeState>(builder: (context, state) {
     if(state.productsRequestState == RequestState.loading){
       return SizedBox();

     }  else if(state.productsRequestState == RequestState.success){
       products= state.products;
       return SizedBox(
         child: GridView.builder(
           shrinkWrap: true,
           physics: const NeverScrollableScrollPhysics(),
           gridDelegate:
           const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
           itemBuilder: (context, index) {
             return ProductItem(
               productName: products[index].name,
               productImage: products[index].image.toString(),
               productPrice: products[index].price.toString(),
               productOldPrice: products[index].oldPrice.toString(),
               productDiscount: products[index].discount.toString(),
               onItemTap: () {
                 push(context, ProductDetailsScreen(id: products[index].id.toInt(),));

               },
               onFavTap: () {
                 ///
                 state.products[index].inFavorites = !state.products[index].inFavorites;
                 setState(() {

                 });
               },
               isInFav: products[index].inFavorites,
             );
           },
           itemCount: products.length,
         ),
       );
     } else{
       return SizedBox();
     }
    },);

  }
}
