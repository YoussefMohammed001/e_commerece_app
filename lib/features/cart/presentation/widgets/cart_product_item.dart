import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/core/widgets/app_image.dart';
import 'package:e_commerece_app/features/product_details/presentation/pages/product_details.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.image, required this.name, required this.price, required this.oldPrice, required this.discount, required this.quantity, required this.delete, required this.inc, required this.dec, required this.id, required this.minusVisible});
  final String image;
  final String name;
  final String price;
  final String oldPrice;
  final int discount;
  final int quantity;
  final VoidCallback delete;
  final VoidCallback inc;
  final VoidCallback dec;
  final int id;
  final bool minusVisible;

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: EdgeInsets.all(10.sp),
          padding: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
            color: Colors.white,
            // border: Border.all(
            //   color:AppColors.primary.withOpacity(0.3),
            // ),
            borderRadius: BorderRadius.circular(15.sp),
          ),
          child: InkWell(
            onTap: () {
              push(
                  context,
                  ProductDetailsScreen(
                      id: id

                  ));
            },
            child: Row(
              children: [
                AppImage(
                    imageUrl: image,
                    width: 20.w,
                    height: 10.h),
                SizedBox(
                  width: 2.w,
                ),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name),

                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [

                                SizedBox(
                                  height:1.h,
                                ),
                                Text("${price} EGP",
                                  style: const TextStyle(
                                      color: AppColors.dark,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Visibility(
                                  visible:  oldPrice
                                      .toString() !=    price
                                      .toString(),
                                  child: Row(
                                    children: [
                                      Text(
                                        oldPrice
                                            .toString(),
                                        style: TextStyle(
                                          decoration: TextDecoration.lineThrough,
                                          color: Colors.grey,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Container(
                                          padding: EdgeInsets.all(8.sp),
                                          decoration: BoxDecoration(
                                              color:
                                              AppColors.primary.withOpacity(.3),
                                              borderRadius:
                                              BorderRadius.circular(10.sp)),
                                          child: Text(
                                            " $discount% ",
                                            style: TextStyle(
                                                color: AppColors.primary,
                                                fontSize: 15.sp),
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const Spacer(),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: inc,
                                  child: Container(
                                      padding: EdgeInsets.all(8.sp),
                                      decoration: BoxDecoration(
                                        border: Border.all(
color: AppColors.grey
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(100.sp),
                                      ),
                                      child:   Icon(
                                        Icons.add,
                                        color: AppColors.grey,
                                        size: 18.sp,
                                      )),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text(quantity
                                    .toString()),
                                Visibility(
                                  visible: minusVisible,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      InkWell(
                                        onTap: dec,
                                        child:  Container(
                                            padding: EdgeInsets.all(8.sp),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: AppColors.grey
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(100.sp),
                                            ),
                                            child:   Icon(
                                              Icons.remove,
                                              size: 18.sp,
                                              color: AppColors.grey,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 2.w,),
                                InkWell(
                                  onTap: delete,
                                  child:  Container(
                                      padding: EdgeInsets.all(8.sp),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.grey
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(100.sp),
                                      ),
                                      child:   Icon(
                                        size: 18.sp,
                                        Icons.delete_outline_outlined,
                                        color: AppColors.grey,
                                      )),
                                ),

                              ],
                            )
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          ),
        );

  }
}