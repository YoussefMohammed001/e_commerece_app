import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.productName, required this.productImage, required this.productPrice, required this.productOldPrice, required this.productDiscount, required this.onItemTap, required this.onFavTap, required this.isInFav,}) : super(key: key);
  final String productName;
  final String productImage;
  final String  productPrice;
  final String productOldPrice;
  final String productDiscount;
  final GestureTapCallback onItemTap;
  final GestureTapCallback onFavTap;
  final bool isInFav;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(5.sp),
      child: InkWell(
        onTap: onItemTap,
        child: Container(
width: 30.w,
padding: EdgeInsets.all(10.sp),

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
                    AppImage(

                      height: 30.h,
                      width: 30.w,
                      imageUrl: productImage,
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
                style:  TextStyle(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '$productPrice EGP', maxLines: 1,
                                  style: TextStyle(
                                      color: AppColors.primary, fontSize: 15.sp,fontWeight: FontWeight.bold),
                                ),

                                     IconButton(
                                      onPressed: onFavTap, icon: Icon(isInFav ? Icons.favorite
                                        : Icons.favorite_border_outlined, color: AppColors.primary,),


                                    ),

                              ],
                            ),


                            SizedBox(
                              width: 2.w,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Visibility(
                                  visible: productPrice != productOldPrice,
                                  child: Text(
                                    '$productOldPrice EGP', maxLines: 1,
                                    style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: productOldPrice != productPrice,
                                  child: Container(
                                      margin: EdgeInsets.all(5.sp),
                                      padding: EdgeInsets.all(10.sp),
                                      decoration: BoxDecoration(borderRadius:
                                      BorderRadius.circular(6.sp),color: AppColors.primary.withOpacity(0.5)),

                                      child: Text(' $productDiscount %',
                                        style: const TextStyle(color: Colors.white),)),
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
    );



  }
}