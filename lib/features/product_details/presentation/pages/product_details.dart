import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/widgets/app_button.dart';
import 'package:e_commerece_app/core/widgets/app_image.dart';
import 'package:e_commerece_app/features/cart/data/models/cart_data_request.dart';
import 'package:e_commerece_app/features/cart/presentation/manager/cart_bloc.dart';
import 'package:e_commerece_app/features/cart/presentation/pages/cart_screen.dart';
import 'package:e_commerece_app/features/main_screen/main_screen.dart';
import 'package:e_commerece_app/features/product_details/presentation/manager/product_details_bloc.dart';
import 'package:e_commerece_app/features/product_details/presentation/widgets/details_app_bar.dart';
import 'package:e_commerece_app/features/saved_items/presentation/manager/favourite_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  late Timer timer;

  @override
  void dispose() {
    timer.cancel();
    // TODO: implement dispose
    super.dispose();
  }
  double dimension = 18;



  @override
  void initState() {
    super.initState();
    timer =  Timer.periodic(const Duration(milliseconds: 800), (timer) {
      setState(() {
        dimension = dimension == 18 ? 18.4 : 18;

      });
    });
  }


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
            return SafeArea(
              child: Scaffold(
                bottomNavigationBar: Row(
                  children: [
                    state.productDetailsEntities!
                        .inCart  == false ? Expanded(
                      child: AppButton(onPressed: (){
                        CartBloc(sl()).add(PostCartEvent(carRequestData:CartDataRequest(
                          id: state
                              .productDetailsEntities!.id.toInt(),
                        )
                        ));
                        state.productDetailsEntities!
                            .inCart =
                        !state.productDetailsEntities!
                            .inCart;
                        setState(() {});
                      }, label: "Add To cart",
                        bgColor: AppColors.primary,
                        margin: EdgeInsets.all(10.sp),
                        padding: EdgeInsets.symmetric(horizontal: 1.sp,vertical: 10.sp),
                        borderRadius: BorderRadius.circular(12.sp),
                      ),
                    ) :
                    Expanded(
                      child: AppButton(onPressed: (){
                        CartBloc(sl()).add(PostCartEvent(carRequestData:CartDataRequest(
                          id: state
                              .productDetailsEntities!.id.toInt(),
                        )
                        ));
                        state.productDetailsEntities!
                            .inCart =
                        !state.productDetailsEntities!
                            .inCart;
                        setState(() {});
                      }, label: "Remove cart",
                      bgColor: AppColors.error,
                        margin: EdgeInsets.all(10.sp),
                        padding: EdgeInsets.symmetric(horizontal: 1.sp,vertical: 10.sp),
                        borderRadius: BorderRadius.circular(12.sp),
                      ),
                    ),
                    // Expanded(
                    //   child: AppButton(onPressed: () async {
                    //     if(  state.productDetailsEntities!
                    //         .inCart == true){
                    //       /// push to check out
                    //     } else{
                    //    addTtoCart(id: state.productDetailsEntities!.id.toInt()).then((value) {
                    //      push(context, CartScreen());
                    //    });
                    //     }
                    //   }, label: "Buy Now",
                    //   bgColor: Colors.grey[300],
                    //     textColor: AppColors.dark,
                    //     margin: EdgeInsets.all(10.sp),
                    //     padding: EdgeInsets.symmetric(horizontal: 1.sp,vertical: 10.sp),
                    //     borderRadius: BorderRadius.circular(12.sp),
                    //   ),
                    // ),
                  ],
                ),
                backgroundColor: Colors.white,
                body: Column(
                  children: [
                DetailsAppBar(
                product: state.productDetailsEntities!.name,
              
                ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                                              children: [
                                                CarouselSlider.builder(
                                                  itemCount:
                                                  state.productDetailsEntities!.images.length,
                                                  itemBuilder: (context, index, realIndex) {
                                                    return Container(
                                                      color: Colors.black.withOpacity(0.3),
                                                      child: AppImage(
                                                          fit: BoxFit.fill,
                                                          imageUrl:
                                                          state.productDetailsEntities!.images[index],
                                                          width: double.infinity,
                                                          height: 70.h),
                                                    );
                                                  },
                                                  options: CarouselOptions(
                                                    height: 25.h,
                                                    viewportFraction: 1,
                                                    autoPlayInterval: const Duration(seconds: 2),

                                                  ),),

                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.all(8.sp),
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Container(
                                                          height : 6.h,
                                                          margin: EdgeInsets.all(12.sp),
                                                            child: Row(
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child: Text(
                                                                    state.productDetailsEntities!.name,
                                                                    style: TextStyle(
                                                                      color: AppColors.dark,
                                                                      fontSize: 17.sp,
                                                                      fontWeight: FontWeight.w500,
                                                                    ),
                                                                  ),
                                                                ),
                                                               InkWell(
                                                                 onTap: (){
                                                                   FavouriteBloc(sl()).add(EditFavEvent(state
                                                                       .productDetailsEntities!.id
                                                                       .toString()));

                                                                   state.productDetailsEntities!
                                                                       .inFavorites =
                                                                   !state.productDetailsEntities!
                                                                       .inFavorites;
                                                                   setState(() {});
                                                                 },
                                                                 child: Icon(
                                                                        size: 20.sp,
                                                                        state.productDetailsEntities!
                                                                            .inFavorites
                                                                            ? Icons.favorite
                                                                            : Icons.favorite_outline,
                                                                        color: AppColors.primary,
                                                                      ),
                                                               ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 1.h,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "${state.productDetailsEntities!.price} EGP",
                                                                style: TextStyle(
                                                                  color: AppColors.grey,
                                                                  fontSize: 17.sp,
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
                                                              color: AppColors.dark,
                                                              fontSize: 17.sp,
                                                              fontWeight: FontWeight.w500,
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
                                            ),
                        ),
                      )
              
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

  Future addTtoCart({required int id}) async {
    await CartBloc(sl())..add(PostCartEvent(carRequestData:CartDataRequest(
      id:id,
    )
    ));
  }
}
