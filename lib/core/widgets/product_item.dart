import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/widgets/app_button.dart';
import 'package:e_commerece_app/core/widgets/app_image.dart';
import 'package:e_commerece_app/features/saved_items/presentation/manager/favourite_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductItem extends StatelessWidget {
  ProductItem({
    Key? key,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productOldPrice,
    required this.productDiscount,
    required this.onItemTap,
    required this.onFavTap,
    required this.isInFav,
    required this.id,
    required this.index,
  }) : super(key: key);
  final String productName;
  final String productImage;
  final String productPrice;
  final String productOldPrice;
  final String productDiscount;
  final GestureTapCallback onItemTap;
  final GestureTapCallback onFavTap;
  final bool isInFav;
  final int id;
  final int index;

  final cubit = FavouriteBloc(sl());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: InkWell(
        onTap: onItemTap,
        child: Container(

          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color:Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 10.sp,

                
              ),
            ],
            borderRadius: BorderRadius.circular(16.sp),
          ),
          margin: EdgeInsets.all(14.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(

                  child: AppImage(
                      imageUrl: productImage,
                      width: double.infinity,
                      height: double.infinity)),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.sp),
                    bottomRight: Radius.circular(16.sp),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      productName,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '$productPrice EGP',
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: AppColors.primary,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Visibility(
                                        visible:
                                            productPrice != productOldPrice,
                                        child: Text(
                                          '$productOldPrice EGP',
                                          maxLines: 1,
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.grey,
                                            fontSize: 13.sp,
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible:
                                            productOldPrice != productPrice,
                                        child: Container(
                                            margin: EdgeInsets.all(5.sp),
                                            padding: EdgeInsets.all(10.sp),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        13.sp),
                                                color: AppColors.primary
                                                    .withOpacity(0.5)),
                                            child: Text(
                                              ' $productDiscount %',
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                        AppButton(
                          bgColor: AppColors.primary,
                          borderRadius: BorderRadius.circular(13.sp),
                          margin: EdgeInsets.all(12.sp),
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.sp, vertical: 2.sp),
                          onPressed: () {},
                          label: 'Add to cart',
                        )
                      ],
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
