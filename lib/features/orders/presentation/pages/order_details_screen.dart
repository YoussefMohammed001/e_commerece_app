import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/core/widgets/app_button.dart';
import 'package:e_commerece_app/core/widgets/app_congrats.dart';
import 'package:e_commerece_app/core/widgets/app_image.dart';
import 'package:e_commerece_app/features/orders/data/order_data.dart';
import 'package:e_commerece_app/features/orders/presentation/manager/orders_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_tracker/order_tracker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderDetailsScreen extends StatefulWidget {
   OrderDetailsScreen({super.key, required this.id});

  final int id;

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
final bloc =     OrdersBloc(sl());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>

      bloc..add(GetOrderDetailsEvent(OrderData(orderId: widget.id))),
      child: Scaffold(
        appBar: AppBar(title: const Text("Order Details",style: TextStyle(color: Colors.white),),iconTheme: const IconThemeData(
          color: Colors.white
        ),backgroundColor: AppColors.primary,),
        body: BlocBuilder<OrdersBloc, OrdersState>(
          builder: (context, state) {
        return state.getOrderDetailsRequestState == RequestState.success ?
        SingleChildScrollView(
          child: Column(
             children: [
               Container(
                 width: double.infinity,
                 margin: EdgeInsets.all(15.sp),
                 padding: EdgeInsets.all(18.sp),
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(17.sp),
                     color: AppColors.primary.withOpacity(0.1)),
                 child: state.orderDetailsEntity!.addressEntities.city.isEmpty
                     ? Center(
                         child: Padding(
                           padding: EdgeInsets.all(20.sp),
                           child: const Column(
                             children: [
                               Text("Add Address"),
                               Icon(
                                 Icons.add,
                                 color: AppColors.primary,
                               )
                             ],
                           ),
                         ))
                     : Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Row(
                       mainAxisAlignment:
                       MainAxisAlignment.spaceBetween,
                       children: [
                         Text(
                           "Deliver to",
                           style: TextStyle(
                               color: AppColors.primary,
                               fontWeight: FontWeight.bold,
                               fontSize: 17.sp),
                         ),

                       ],
                     ),
                     Row(
                       children: [
                         Text(
                             "${state.orderDetailsEntity!.addressEntities.name} - "),
                         Text(
                             "${state.orderDetailsEntity!.addressEntities.city} - "),
                         Text(
                             "${state.orderDetailsEntity!.addressEntities.region} - "),
                         Text(
                             "${state.orderDetailsEntity!.addressEntities.details}"),
                       ],
                     ),
                     const Text(
                       "Notes",
                       style: TextStyle(
                           color: AppColors.primary,
                           fontWeight: FontWeight.bold),
                     ),
                     Text("${state.orderDetailsEntity!.addressEntities.notes}"),
                   ],
                 ),
               ),
               Container(
                 width: double.infinity,
                 decoration: BoxDecoration(
                   color: AppColors.primary.withOpacity(0.1),
                   borderRadius: BorderRadius.circular(15.sp),

                 ),
                 margin: EdgeInsets.all(15.sp),
                 padding: EdgeInsets.all(18.sp),
                 child: Padding(
                   padding: const EdgeInsets.all(20),
                   child:state.orderDetailsEntity!.status == "Cancelled" ?Center(child:  Text("Order Cancelled",
                     style: TextStyle(color: AppColors.primary,fontSize: 18.sp,
                       fontWeight: FontWeight.bold
                   ),)) : Column(
                     children: [
                       OrderTracker(
                         status: state.orderDetailsEntity!.status == "New" ?Status.order : Status.delivered,
                         activeColor: AppColors.primary,
                         inActiveColor: Colors.grey[300],
                         headingDateTextStyle: TextStyle(color: AppColors.primary.withOpacity(0.1),fontSize: 0),

                       ),
                       SizedBox(height: 3.h,),
                       BlocConsumer<OrdersBloc, OrdersState>(
  listener: (context, state) {
    if(state.cancelOrderRequestState == RequestState.success){
      pushReplacement(context, const AppCongrats(title: "Order Cancelled", icon: "check.png"));
    }
  },
  builder: (context, state) {

    if(state.cancelOrderRequestState == RequestState.loading ){
      return   const CircularProgressIndicator();
    } else{
      return AppButton(onPressed: (){
          bloc.add(CancelOrderEvent(OrderData(
            orderId: state.orderDetailsEntity!.id
          )));
          setState(() {

          });
      }, label:'Cancel Order',
          padding: EdgeInsets.all(8.sp), margin: EdgeInsets.all(8.sp),
          bgColor: AppColors.primary,
          borderRadius: BorderRadius.circular(15.sp),
      );
    }

  },
)

                     ],
                   ),
                 ),
               ),

               Container(
                 width: double.infinity,
                 margin: EdgeInsets.all(15.sp),

                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(17.sp),
                     color: AppColors.primary.withOpacity(0.1)),
                 child: Column(
                   children: [
                     Padding(
                       padding:  EdgeInsets.all(14.sp),
                       child: Text("Order Details",style: TextStyle(color: AppColors.primary,fontSize: 18.sp,
                       fontWeight: FontWeight.bold
                       ),
                       ),
                     ),
Container(
  padding: EdgeInsets.all(14.sp),
 decoration: BoxDecoration(
   color: AppColors.primary.withOpacity(0.2),

 ),
  child:   Row(

    mainAxisAlignment: MainAxisAlignment.spaceBetween,

    children: [

      const Text("Date"),

      Text(state.orderDetailsEntity!.date),

    ],

  ),
),

                     Container(
  padding: EdgeInsets.all(14.sp),
 decoration: BoxDecoration(
   color: AppColors.primary.withOpacity(0.3),

 ),
  child:   Row(

    mainAxisAlignment: MainAxisAlignment.spaceBetween,

    children: [

      const Text("Price"),

      Text("${state.orderDetailsEntity!.total.toInt()} EGP"),

    ],

  ),
),
                     Container(
  padding: EdgeInsets.all(14.sp),
 decoration: BoxDecoration(
   color: AppColors.primary.withOpacity(0.2),

 ),
  child:   const Row(

    mainAxisAlignment: MainAxisAlignment.spaceBetween,

    children: [

      Text("VAT"),

      Text("14%"),

    ],

  ),
),

                     Container(
  padding: EdgeInsets.all(14.sp),
 decoration: BoxDecoration(
   color: AppColors.primary.withOpacity(0.3),
    borderRadius: BorderRadius.only(
      bottomRight:  Radius.circular(17.sp),
      bottomLeft:  Radius.circular(17.sp),
    )
 ),
  child:   Row(

    mainAxisAlignment: MainAxisAlignment.spaceBetween,

    children: [

      const Text("Total Price"),

      Text("${state.orderDetailsEntity!.cost.toInt()} EGP"),

    ],

  ),
),


                   ],
                 ),
               ),

Container(
  margin: EdgeInsets.all(15.sp),
  child:   Row(
  
    children: [
  
      Text("Products",style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.bold,fontSize: 18.sp
  
  
  
      ),),   Text("(${state.orderDetailsEntity!.cartEntities.length})",style: TextStyle( fontWeight: FontWeight.bold,fontSize: 18.sp
  
  
  
      ),),
  
  
  
    ],
  
  ),
),
SizedBox(
  height: 29.h,

  child:   ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount:state.orderDetailsEntity!.cartEntities.length ,
    itemBuilder: (context, index) {
    safePrint(state.orderDetailsEntity!.cartEntities[index].image);
      return Container(
        width: 52.w,
        margin:EdgeInsets.all(15.sp),
        padding: EdgeInsets.all(13.sp),
        decoration: BoxDecoration(
          color: Colors.white,
          
          border: Border.all(color: AppColors.primary.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(18.sp)
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            AppImage(imageUrl: state.orderDetailsEntity!.cartEntities[index].image, width: 20.w, height: 10.h,

            ),
            Expanded(
              child: Text(state.orderDetailsEntity!.cartEntities[index].name,style: TextStyle(
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 2,
              ),
            ),
            Text("${state.orderDetailsEntity!.cartEntities[index].price} EGP"),
            Text("Quantity: ${state.orderDetailsEntity!.cartEntities[index].quantity}"),
        ],
    ),
      );
    },),
)
             ],
           ),
        ) : const SizedBox();
          },
        ),
      ),
    );
  }
}
