import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/widgets/app_image.dart';
import 'package:e_commerece_app/features/cart/presentation/manager/cart_bloc.dart';
import 'package:e_commerece_app/features/product_details/presentation/manager/product_details_bloc.dart';
import 'package:e_commerece_app/features/product_details/presentation/widgets/details_app_bar.dart';
import 'package:e_commerece_app/features/saved_items/presentation/manager/favourite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatefulWidget {

  const ProductDetailsScreen({super.key, required this.id,  this.image = ""});
  final int id;
final String image;
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
        CartBloc(sl()),),
        BlocProvider(
          create: (context) =>
              ProductDetailsBloc(sl(),sl())..add(ProductDetailsEvent(widget.id)),
        ),
        BlocProvider(
          create: (context) => FavouriteBloc(sl()),
        ),

      ],
      child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, state) {
          if (state.requestState == RequestState.loading) {
            return Hero(
              tag:widget.image,
              child: Container(
                color: AppColors.primary,
                child: const SafeArea(
                  child: Scaffold(
                      body: Center(
                          child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ))),
                ),
              ),
            );
          } else if (state.requestState == RequestState.success) {
            return Hero(
              tag:widget.image,
              child: Scaffold(
                backgroundColor: Colors.white,
                body: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      title:            DetailsAppBar(
                          product: state.productDetailsEntities!.name,
                        isFav:state.productDetailsEntities!
                            .inFavorites ,
                        onFav: () {
                          FavouriteBloc(sl()).add(EditFavEvent(state
                              .productDetailsEntities!.id
                              .toString()));

                          state.productDetailsEntities!
                              .inFavorites =
                          !state.productDetailsEntities!
                              .inFavorites;
                          setState(() {});
                        },),
                      // bottom: PreferredSize(
                      //   preferredSize: Size.fromHeight(20.h),
                      //   child:            DetailsAppBar(
                      //       product: state.productDetailsEntities!.name),
                      //
                      //
                      //
                      //
                      // ),

                      leading:SizedBox(),
                      leadingWidth: 0,
                       toolbarHeight: 5.h,
                       backgroundColor: AppColors.primary.withOpacity(0.2),
                      expandedHeight: 40.h,
                      flexibleSpace: FlexibleSpaceBar(
                        background:
                        Container(
                          child: CarouselSlider.builder(
                                    itemCount:
                                        state.productDetailsEntities!.images.length,
                                    itemBuilder: (context, index, realIndex) {
                                      return Container(
                                        color: Colors.black.withOpacity(0.3),
                                        child: AppImage(
                                            imageUrl:
                                                state.productDetailsEntities!.images[index],
                                            width: double.infinity,
                                            height: 100.h),
                                      );
                                    },
                            options: CarouselOptions(
                              height: 45.h,
                              viewportFraction: 1,
                              autoPlayInterval: const Duration(seconds: 2),

                            ),),
                        )
                      ),
                      bottom: PreferredSize(
                          preferredSize:Size.fromHeight(20) ,

                          child: Container(
                            width: double.infinity,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  )),
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                              child: Text("jjjjjjj"))),

                    ),
                    SliverToBoxAdapter(
                      child:
                      Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                        ],
                      )
                      ,
                    ),
                  ],
                ),

              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),

    );
  }
}
