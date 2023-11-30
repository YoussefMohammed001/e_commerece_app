import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/shared/my_shared.dart';
import 'package:e_commerece_app/core/shared/my_shared_keys.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/core/widgets/app_button.dart';
import 'package:e_commerece_app/core/widgets/app_image.dart';
import 'package:e_commerece_app/features/cart/data/models/request_data.dart';
import 'package:e_commerece_app/features/cart/presentation/manager/cart/cart_bloc.dart';
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
        BlocProvider(
          create: (context) =>
              ProductDetailsBloc(sl())..add(ProductDetailsEvent(widget.id)),
        ),
        BlocProvider(
          create: (context) => FavouriteBloc(sl()),
        ),
      ],
      child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, state) {
          if (state.requestState == RequestState.loading) {
            return const Scaffold(
                body: Center(
                    child: CircularProgressIndicator(
              color: AppColors.primary,
            )));
          } else if (state.requestState == RequestState.success) {
            return Scaffold(
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                bottomNavigationBar: state.productDetailsEntities!.inCart == false ? AppButton(
                  bgColor: AppColors.primary,
                  padding: EdgeInsets.all(12.sp),
                  margin: EdgeInsets.all(15.sp),
                  borderRadius: BorderRadius.circular(13.sp),
                  onPressed: () {
                    safePrint("added");
                    CartBloc(sl(),sl()).add(PostCartEvent(CarRequestData(id: state.productDetailsEntities!.id.toInt(), quantity: 0)));
                    state.productDetailsEntities!.inCart =  !state.productDetailsEntities!.inCart;
                    setState(() {

                    });
                    },
                  label: "Add To Cart",
                ) :
                  CartBloc(sl(),sl()).state.postRequestState == RequestState.loading ? CircularProgressIndicator()
                  :
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: (){
                        CartBloc(sl(),sl()).add(PostCartEvent(CarRequestData(id: state.productDetailsEntities!.id.toInt(), quantity: 0)));

                        setState(() {

                        });
                      }, icon: const Icon(Icons.delete),color: Colors.red,),

                      InkWell(
                        onTap: () {
                          CartBloc(sl(),sl()).add(PutCartEvent(
                              CarRequestData(
                                  id: int.parse(MyShared.getString(key: MySharedKeys.cartId)),
                                  quantity: quantity+1
                              )));
                          setState(() {

                          });
                        },
                        child: Container(
                            padding: EdgeInsets.all(8.sp),
                            decoration: BoxDecoration(
                              color: AppColors.primary
                                  .withOpacity(0.5),
                              borderRadius:
                              BorderRadius.circular(13.sp),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            )),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      BlocProvider(
  create: (context) => CartBloc(sl(),sl()),
  child: BlocBuilder<CartBloc, CartState>(
  builder: (context, state) {

    return Text(quantity.toString());

  },
),
),
                      SizedBox(
                        width: 2.w,
                      ),
                      InkWell(
                        onTap: (){
                          if(quantity > 1){

                            CartBloc(sl(),sl()).add(PutCartEvent(
                                CarRequestData(
                                    id: int.parse(MyShared.getString(key: MySharedKeys.cartId)),
                                    quantity: quantity-1
                                )));
                            setState(() {

                            });
                          }
                        },
                        child: Container(
                            padding: EdgeInsets.all(8.sp),
                            decoration: BoxDecoration(
                              color: AppColors.primary
                                  .withOpacity(0.5),
                              borderRadius:
                              BorderRadius.circular(13.sp),
                            ),
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                            )),
                      ),
                    ],
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
                                        ? CircularProgressIndicator()
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
                                                TextStyle(color: Colors.white),
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
                              moreStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary),
                              lessStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
