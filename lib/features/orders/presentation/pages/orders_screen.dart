import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/features/orders/presentation/manager/orders_bloc.dart';
import 'package:e_commerece_app/features/orders/presentation/pages/order_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersBloc(sl())..add(GetOrdersEvent()),
      child: Scaffold(
        appBar: AppBar(title: Text("Orders",style: TextStyle(
          color: Colors.white,

        ),),backgroundColor: AppColors.primary,
        iconTheme: IconThemeData(color: Colors.white),
        ),
        body: BlocBuilder<OrdersBloc, OrdersState>(
          builder: (context, state) {
            if (state.getOrdersRequestState == RequestState.success) {
              return ListView.builder(
                  itemBuilder: (context, index) => InkWell(
                    onTap: (){
                      push(context, OrderDetailsScreen( id:state.orders[index].id ,));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10.sp,horizontal: 25.sp),
                      padding: EdgeInsets.all(17.sp),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17.sp),
                        color: AppColors.primary.withOpacity(0.1),
                      ),
                      child: Column(
                        children: [
                          Text(state.orders[index].date),
                          Text(state.orders[index].total.toString()),
                          Text(state.orders[index].status),
                        ],
                      ),
                    ),
                  ),
              itemCount: state.orders.length,
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
