import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/core/widgets/app_image.dart';
import 'package:e_commerece_app/features/orders/presentation/manager/orders_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({super.key});

  final bloc = OrdersBloc(sl());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..add(GetOrdersEvent()),
      child: BlocConsumer<OrdersBloc, OrdersState>(
listener: (context, state) {
  if(state.getOrdersRequestState == RequestState.success){
    bloc.add(GetOrdersDetailsEvent(""));

  }
},
        builder: (context, state) {

          if (state.getOrderDetailsRequestState == RequestState.success){
          return Scaffold(
            backgroundColor: AppColors.bg,
            appBar: AppBar(
               toolbarHeight: 0,backgroundColor: AppColors.bg,

            ),
            body:  Padding(
              padding:  EdgeInsets.all(13.sp),
              child: Column(
                children: [
              Expanded(

              child: ListView.builder(
              itemCount: bloc.orders.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10.sp),
                    padding: EdgeInsets.all(13.sp),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13.sp),


                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(bloc.orders[index].date),
                            Text(bloc.orders[index].status),
                          ],
                        ),
                        SizedBox(height: 2.h,),
                        Row(
                          children: [
                            const Text("Deliver to: ",
                              style: TextStyle(
                                color: AppColors.dark,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(bloc.orders[index].orderAddress!.name + bloc.orders[index].orderAddress!.details + bloc.orders[index].orderAddress!.region + bloc.orders[index].orderAddress!.city,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                color: AppColors.grey
                              ),
                            ),
                          ],
                        ),
                         SizedBox(height: 2.h,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text("Products",
                                                     style: TextStyle(
                              color: AppColors.dark,
                              fontWeight: FontWeight.w800,fontSize: 18.sp
                                                     ),
                                                     ),
                             Text(bloc.orders[index].productDetailsEntities.length.toString(),
                                                     style: TextStyle(
                              color: AppColors.grey,
                              fontWeight: FontWeight.w800,fontSize: 18.sp
                                                     ),
                                                     ),
                           ],
                         ),
                        SizedBox(
                          height: 13.h,
                          child: ListView.builder(itemBuilder: (context, pIndex) {

                          return Container(
                            width: 50.w,

                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(13.sp),
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 14.sp),
                            padding: EdgeInsets.symmetric(horizontal: 1.sp,
                            vertical: 15.sp
                            ),
                            child: Row(

                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.sp),
                                  child: AppImage(
                                      imageUrl:bloc.orders[index].productDetailsEntities[pIndex].image,
                                    width: 20.w, height: double.infinity,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(bloc.orders[index].productDetailsEntities[pIndex].name,
                                      maxLines: 2,
                                        style: const TextStyle(
                                          color: AppColors.dark,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text("${bloc.orders[index].productDetailsEntities[pIndex].price} EGP",
                                      maxLines: 2,
                                        style: const TextStyle(
                                          color: AppColors.grey,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text("${bloc.orders[index].productDetailsEntities[pIndex].quantity} items",
                                      maxLines: 2,
                                        style: const TextStyle(
                                          color: AppColors.grey,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                          },
                            shrinkWrap: true,

                          itemCount: bloc.orders[index].productDetailsEntities.length,
                            scrollDirection: Axis.horizontal,
                          ),
                        )
                      ],


                    ),
                  );
                },

              ),
                        ),
                ],
              ),
            ),
          );
        }
          else{
            return const CircularProgressIndicator();
          }

        },
      ),
    );
  }
}

