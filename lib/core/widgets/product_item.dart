import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/widgets/app_image.dart';
import 'package:e_commerece_app/features/saved_items/presentation/manager/favourite_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      child: Padding(
        padding: EdgeInsets.all(5.sp),
        child: InkWell(
          onTap: onItemTap,
          child: Container(
            width: 30.w,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10.sp),
            ),
            margin: EdgeInsets.all(5.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.red,
                        child: Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            AppImage(
                              height: 20.h,

                              imageUrl: productImage, width: 35.w,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18.sp)
                              ),
                              child: IconButton(
                                onPressed: onFavTap,
                                icon: Icon(
                                  isInFav
                                      ? Icons.favorite
                                      : Icons
                                      .favorite_border_outlined,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  productName,
                  textAlign: TextAlign.center,
                  maxLines: 2,
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
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
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
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Visibility(
                                    visible: productPrice !=
                                        productOldPrice,
                                    child: Text(
                                      '$productOldPrice EGP',
                                      maxLines: 1,
                                      style: TextStyle(
                                        decoration: TextDecoration
                                            .lineThrough,
                                        color: Colors.grey,
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: productOldPrice !=
                                        productPrice,
                                    child: Container(
                                        margin: EdgeInsets.all(5.sp),
                                        padding: EdgeInsets.all(10.sp),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(13.sp),
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
                        SizedBox(
                          width: 1.h,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                  width: 2.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
