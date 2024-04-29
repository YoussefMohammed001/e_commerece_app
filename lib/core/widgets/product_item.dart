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
          margin: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16.sp),
            bottomRight: Radius.circular(16.sp),
          )),
          child: Material(
            elevation: 10.sp,
            borderRadius: BorderRadius.circular(16.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppImage(
                  imageUrl: productImage,
                  width: double.infinity.w,
                  height: 10.h,
                  topLeftRadius: 16.sp,
                  topRightRadius: 16.sp,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 7.sp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16.sp),
                      bottomRight: Radius.circular(16.sp),
                    )),
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        Text(
                          productName,
                          style: const TextStyle(

                            fontWeight: FontWeight.w500,

                          ),
                          maxLines: 1,

                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(productPrice+" EGP",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16.sp,
                              
                              ),
                              
                              ),
                            ),
                            Visibility(
                                visible: productOldPrice != productPrice,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("${productOldPrice}EGP",
                                    style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 14.sp,
                                    ),
                                    ),
                                    SizedBox(width: 1.w,),
                                    Container(
                                      padding: EdgeInsets.all(8.sp),
                                        decoration: BoxDecoration(
                                          borderRadius: 
                                          
                                          BorderRadius.circular(13.sp),
                                          color: AppColors.
                                          primary.withOpacity(0.2)
                                        ),
                                        child: Text("$productDiscount%",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                        ),
                                        )),
                                  ],
                                )),
                          ],
                        ),

                        AppButton(
                          onPressed: () {},
                          borderRadius: BorderRadius.circular(13.sp),
                          label: "Add to cart",
                          bgColor: AppColors.primary,
                          margin: EdgeInsets.symmetric(
                              horizontal: 12.sp, vertical: 7.sp),
                          padding: EdgeInsets.symmetric(
                              vertical: 5.sp, horizontal: 3.sp),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
