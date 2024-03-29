import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/widgets/app_button.dart';
import 'package:e_commerece_app/core/widgets/app_image.dart';
import 'package:e_commerece_app/features/cart/data/models/cart_data_request.dart';
import 'package:e_commerece_app/features/cart/presentation/manager/cart_bloc.dart';
import 'package:e_commerece_app/features/product_details/presentation/manager/product_details_bloc.dart';
import 'package:e_commerece_app/features/product_details/presentation/widgets/details_app_bar.dart';
import 'package:e_commerece_app/features/saved_items/presentation/manager/favourite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatefulWidget {

  const ProductDetailsScreen({super.key, required this.id});
  final int id;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:  (context) =>
        CartBloc(sl()),
        ),
        BlocProvider(
          create: (context) =>
              ProductDetailsBloc(sl(),sl())..add(ProductDetailsEvent(widget.id)),
        ),
        BlocProvider(
          create: (context) => FavouriteBloc(sl()),
        ),

      ],
      child: BlocListener<CartBloc, CartState>(
  listener: (context, state) {

   },
  child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, state) {
          if (state.requestState == RequestState.loading) {
            return Container(
              color: AppColors.primary,
              child: const SafeArea(
                child: Scaffold(
                    body: Center(
                        child: CircularProgressIndicator(
                  color: AppColors.primary,
                ))),
              ),
            );
          } else if (state.requestState == RequestState.success) {
            return Container(
              color: AppColors.primary,
              child: SafeArea(
                child: Scaffold(
                    floatingActionButtonLocation:
                        FloatingActionButtonLocation.centerFloat,
                    bottomNavigationBar:
                    context.read<CartBloc>().state.addToCartRequestState == RequestState.loading  ?
                        const CircularProgressIndicator()
                        :

                    AppButton(
                        bgColor:state.productDetailsEntities!.inCart == false ?AppColors.primary : AppColors.red,
                        padding: EdgeInsets.all(12.sp),
                        margin: EdgeInsets.all(15.sp),
                        borderRadius: BorderRadius.circular(13.sp),
                        onPressed: () {
                          showDialog(context: context, builder:
                          (context) {
                            return CircularProgressIndicator();
                          },);
                          Future.delayed(Duration(seconds: 4));
                          CartBloc(sl()).add(PostCartEvent(CartDataRequest(id: state.productDetailsEntities!.id.toInt(), quantity: 0)));
                          pop(context);
                          setState(() {
                            state.productDetailsEntities!.inCart =  !state.productDetailsEntities!.inCart;

                          });
                        },
                        label: state.productDetailsEntities!.inCart == false ? "Add To Cart" : "Remove From Cart",
                      ),


                    body: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DetailsAppBar(
                              product: state.productDetailsEntities!.name),
                          CarouselSlider.builder(
                              itemCount:
                                  state.productDetailsEntities!.images.length,
                              itemBuilder: (context, index, realIndex) {
                                return AppImage(
                                    imageUrl:
                                        state.productDetailsEntities!.images[index],
                                    width: double.infinity,
                                    height: 50);
                              },
                              options: CarouselOptions(
                                enlargeCenterPage: true,
                              )),
                          Padding(
                            padding: EdgeInsets.all(8.sp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        state.productDetailsEntities!.name,
                                        style: TextStyle(
                                          color: AppColors.primary,
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                              IconButton(
                                        onPressed: () {
                                          FavouriteBloc(sl()).add(EditFavEvent(state
                                              .productDetailsEntities!.id
                                              .toString()));

                                          state.productDetailsEntities!
                                                  .inFavorites =
                                              !state.productDetailsEntities!
                                                  .inFavorites;
                                          setState(() {});
                                        },
                                        icon: FavouriteBloc(sl())
                                                    .state
                                                    .changeFavRequest ==
                                                RequestState.loading
                                            ? const CircularProgressIndicator()
                                            : Icon(
                                                state.productDetailsEntities!
                                                            .inFavorites ==
                                                        true
                                                    ? Icons.favorite
                                                    : Icons.favorite_outline,
                                                color: AppColors.primary,
                                              ))
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      state.productDetailsEntities!.price
                                          .toString(),
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Visibility(
                                      visible: state.productDetailsEntities!.price
                                              .toString() !=
                                          state.productDetailsEntities!.oldPrice
                                              .toString(),
                                      child: Row(
                                        children: [
                                          Text(
                                            state.productDetailsEntities!.oldPrice
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.grey[400],
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.lineThrough),
                                          ),
                                          Container(
                                              margin: EdgeInsets.all(9.sp),
                                              padding: EdgeInsets.all(10.sp),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10.sp),
                                                  color: AppColors.primary
                                                      .withOpacity(0.5)),
                                              child: Text(
                                                "${state.productDetailsEntities!.discount}%",
                                                style:
                                                    const TextStyle(color: Colors.white),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  "Description",
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                ReadMoreText(
                                  "${state.productDetailsEntities!.description}",
                                  colorClickableText: AppColors.primary,
                                  trimCollapsedText: ' Show more',
                                  trimExpandedText: ' Show less',
                                  moreStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primary),
                                  lessStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primary),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
),
    );
  }
}
