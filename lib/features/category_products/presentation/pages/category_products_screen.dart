import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/widgets/product_item.dart';
import 'package:e_commerece_app/features/category_products/domain/entities/category_product.dart';
import 'package:e_commerece_app/features/category_products/presentation/manager/category_products_bloc.dart';
import 'package:e_commerece_app/features/product_details/presentation/pages/product_details.dart';
import 'package:e_commerece_app/features/saved_items/presentation/manager/favourite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoriesProductsScreen extends StatefulWidget {
  const CategoriesProductsScreen({super.key, required this.id, required this.category});

  final String id;
  final String category;

  @override
  State<CategoriesProductsScreen> createState() => _CategoriesProductsScreenState();
}

class _CategoriesProductsScreenState extends State<CategoriesProductsScreen> {
  List<CategoryProductsEntities> products = [];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
  providers: [
    BlocProvider(
      create: (context) => CategoryProductsBloc(sl())..add(CategoryProductsEvent(id: widget.id)),
),
    BlocProvider(
      create: (context) => FavouriteBloc(sl()),
    ),
  ],
  child: Scaffold(
        body: Column(
          children: [

            BlocBuilder<CategoryProductsBloc, CategoryProductsState>(
  builder: (context, state) {
    if(state.requestState == RequestState.success){
      products = state.categoryProducts;
      return  Expanded(

        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_sharp,
                        color: AppColors.primary,
                      )),
                  Text(

                    widget.category,
                    style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        overflow:  TextOverflow.ellipsis
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                  //      push(context, CartScreen());
                      },


                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        color: AppColors.primary,
                      )),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.all(5.sp),
                          shrinkWrap: true,
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
                                FavouriteBloc(sl()).add(EditFavEvent(products[index].id.toString()));
                                products[index].inFavorites = !products[index].inFavorites;
                                setState(() {
                                });

                              },
                              isInFav: products[index].inFavorites,
                              id: products[index].id.toInt(), index: index,
                            );
                          },
                          itemCount: products.length,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else if(state.requestState == RequestState.loading){
      return Expanded(child: Center(child: CircularProgressIndicator(color: AppColors.primary,)));
      
    } else{
      return SizedBox();
    }
  },
),
          ],
        ),
      ),
);
  }
}
