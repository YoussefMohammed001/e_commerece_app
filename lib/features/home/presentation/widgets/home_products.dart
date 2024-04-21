import 'package:e_commerece_app/core/enitites/product_details_entities.dart';
import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/widgets/product_item.dart';
import 'package:e_commerece_app/features/home/presentation/manager/home_bloc.dart';
import 'package:e_commerece_app/features/product_details/presentation/pages/product_details.dart';
import 'package:e_commerece_app/features/saved_items/presentation/manager/favourite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeProducts extends StatefulWidget {
   const HomeProducts({super.key});


  @override
  State<HomeProducts> createState() => _HomeProductsState();
}

class _HomeProductsState extends State<HomeProducts> {
  List<ProductDetailsEntities> products = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc,HomeState>(builder: (context, state) {
     if(state.productsRequestState == RequestState.loading){
       return Center(child: CircularProgressIndicator());

     }  else if(state.productsRequestState == RequestState.success){
       products= state.products;
       return Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           SizedBox(
             child: GridView.builder(
               shrinkWrap: true,
               physics: const NeverScrollableScrollPhysics(),
               gridDelegate:
               const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
               itemBuilder: (context, index) {
                 return Hero(
                   tag: products[index].image.toString(),
                   child: ProductItem(
                     productName: products[index].name,
                     productImage: products[index].image.toString(),
                     productPrice: products[index].price.toString(),
                     productOldPrice: products[index].oldPrice.toString(),
                     productDiscount: products[index].discount.toString(),
                     onItemTap: () {
                       push(context, ProductDetailsScreen(id: products[index].id.toInt(), image: products[index].image.toString(),));

                     },
                     onFavTap: () {
                       FavouriteBloc(sl()).add(EditFavEvent(state.products[index].id.toString()));
                       state.products[index].inFavorites = !state.products[index].inFavorites;
                       setState(() {
                       });

                     },
                     isInFav: products[index].inFavorites, id: products[index].id.toInt(), index: index,
                   ),
                 );
               },
               itemCount: products.length,
             ),
           ),
         ],
       );
     } else{
       return SizedBox();
     }
    },);

  }
}
