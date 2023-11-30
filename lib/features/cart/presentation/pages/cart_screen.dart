import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/widgets/app_button.dart';
import 'package:e_commerece_app/core/widgets/app_congrats.dart';
import 'package:e_commerece_app/features/cart/data/address_data.dart';
import 'package:e_commerece_app/features/cart/data/models/request_data.dart';
import 'package:e_commerece_app/features/cart/presentation/manager/cart/cart_bloc.dart';
import 'package:e_commerece_app/features/cart/presentation/widgets/address_item.dart';
import 'package:e_commerece_app/features/cart/presentation/widgets/cart_item.dart';
import 'package:e_commerece_app/features/orders/data/order_data.dart';
import 'package:e_commerece_app/features/orders/presentation/manager/orders_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final carBloc = CartBloc(sl(), sl());
  TextEditingController name = TextEditingController();
  TextEditingController region = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController details = TextEditingController();
  TextEditingController note = TextEditingController();
   final  orderBloc = OrdersBloc(sl());
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => carBloc
            ..add(GetCartEvent())
            ..add(GetAddressEvent()),
        ),
        BlocProvider(
          create: (context) => orderBloc,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Cart',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: AppColors.primary,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state.getRequestState == RequestState.loading) {
              return const Center(
                  child: CircularProgressIndicator(
                color: AppColors.primary,
              ));
            } else {
              return state.cartEntities!.cartItems.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.all(20.sp),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17.sp),
                              color: AppColors.primary.withOpacity(0.1)),
                          padding: EdgeInsets.all(14.sp),
                          child: state.addressEntities!.city.isEmpty
                              ? InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AddressDialogue(
                                        name: name,
                                        region: region,
                                        city: city,
                                        details: details,
                                        note: note,
                                        title: 'Edit Address',
                                        onTap: () {
                                          carBloc.add(AddAddressEvent(
                                              addressData: AddressData(
                                            id: state.addressEntities!.id,
                                            name: name.text,
                                            city: city.text,
                                            region: region.text,
                                            details: details.text,
                                            notes: note.text,
                                          )));
                                          state.addressEntities!.name =
                                              name.text;
                                          state.addressEntities!.city =
                                              city.text;
                                          state.addressEntities!.region =
                                              region.text;
                                          state.addressEntities!.details =
                                              details.text;
                                          state.addressEntities!.notes =
                                              note.text;
                                          pop(context);
                                        },
                                      ),
                                    );
                                  },
                                  child: Center(
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
                                  )),
                                )
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
                                        InkWell(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AddressDialogue(
                                                  name: name,
                                                  region: region,
                                                  city: city,
                                                  details: details,
                                                  note: note,
                                                  title: 'Edit Address',
                                                  onTap: () {
                                                    carBloc.add(
                                                        UpdateAddressEvent(
                                                            addressData:
                                                                AddressData(
                                                      id: state
                                                          .addressEntities!.id,
                                                      name: name.text,
                                                      city: city.text,
                                                      region: region.text,
                                                      details: details.text,
                                                      notes: note.text,
                                                    )));
                                                    state.addressEntities!
                                                        .name = name.text;
                                                    state.addressEntities!
                                                        .city = city.text;
                                                    state.addressEntities!
                                                        .region = region.text;
                                                    state.addressEntities!
                                                        .details = details.text;
                                                    state.addressEntities!
                                                        .notes = note.text;
                                                    pop(context);
                                                  },
                                                ),
                                              );
                                            },
                                            child: const Icon(
                                              Icons.edit_outlined,
                                              color: AppColors.primary,
                                            )),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                            "${state.addressEntities!.name} - "),
                                        Text(
                                            "${state.addressEntities!.city} - "),
                                        Text(
                                            "${state.addressEntities!.region} - "),
                                        Text(
                                            "${state.addressEntities!.details}"),
                                      ],
                                    ),
                                    const Text(
                                      "Notes",
                                      style: TextStyle(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("${state.addressEntities!.notes}"),
                                  ],
                                ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: Row(
                            children: [
                              Text(
                                "Products ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19.sp),
                              ),
                              Text(
                                "(${state.cartEntities!.cartItems.length.toString()})",
                                style: TextStyle(
                                    fontSize: 19.sp,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.cartEntities?.cartItems.length,
                            itemBuilder: (context, index) {
                              return CartItem(
                                image: state.cartEntities!.cartItems[index]
                                    .productDetailsEntities.image,
                                name: state.cartEntities!.cartItems[index]
                                    .productDetailsEntities.name,
                                price:
                                    "${state.cartEntities!.cartItems[index].productDetailsEntities.price.toInt()} EGP",
                                oldPrice:
                                    "${state.cartEntities!.cartItems[index].productDetailsEntities.oldPrice.toInt()} EGP",
                                discount: state.cartEntities!.cartItems[index]
                                    .productDetailsEntities.discount
                                    .toInt(),
                                quantity: state
                                    .cartEntities!.cartItems[index].quantity,
                                delete: () async {
                                  setState(() {
                                    carBloc.add(DeleteCartEvent(CarRequestData(
                                        id: state
                                            .cartEntities!.cartItems[index].id
                                            .toInt(),
                                        quantity: state.cartEntities!
                                            .cartItems[index].quantity)));
                                    state.cartEntities?.cartItems
                                        .removeAt(index);
                                  });
                                },
                                inc: () {
                                  setState(() {
                                    carBloc.add(PutCartEvent(CarRequestData(
                                        id: state
                                            .cartEntities!.cartItems[index].id
                                            .toInt(),
                                        quantity: state.cartEntities!
                                                .cartItems[index].quantity +
                                            1)));
                                    state.cartEntities!.cartItems[index]
                                        .quantity = state.cartEntities!
                                            .cartItems[index].quantity +
                                        1;
                                    carBloc.add(GetCartEvent());
                                  });
                                },
                                dec: () {
                                  if (state.cartEntities!.cartItems[index]
                                          .quantity >
                                      1) {
                                    setState(() {
                                      carBloc.add(PutCartEvent(CarRequestData(
                                          id: state
                                              .cartEntities!.cartItems[index].id
                                              .toInt(),
                                          quantity: state.cartEntities!
                                                  .cartItems[index].quantity -
                                              1)));
                                      state.cartEntities!.cartItems[index]
                                          .quantity = state.cartEntities!
                                              .cartItems[index].quantity -
                                          1;
                                      carBloc.add(GetCartEvent());
                                    });
                                  }
                                },
                                id: state.cartEntities!.cartItems[index]
                                    .productDetailsEntities.id
                                    .toInt(),
                                minusVisible: state.cartEntities!
                                        .cartItems[index].quantity >
                                    1,
                              );
                            },
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                color: Colors.grey[100],
                                padding: EdgeInsets.all(14.sp),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Sub Total",
                                      style: TextStyle(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.sp),
                                    ),
                                    Text("${state.cartEntities!.total} EGP"),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.grey[50],
                                padding: EdgeInsets.all(14.sp),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "VAT",
                                      style: TextStyle(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.sp),
                                    ),
                                    const Text("14%"),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.grey[100],
                                padding: EdgeInsets.all(14.sp),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total Price",
                                      style: TextStyle(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.sp),
                                    ),
                                    Text(
                                        "${state.cartEntities!.total + (14 / 100 * state.cartEntities!.total)} EGP"),
                                  ],
                                ),
                              ),
                              BlocConsumer<OrdersBloc, OrdersState>(
                                listener: (context, state) {
                                  if (state.addOrderRequestState ==
                                      RequestState.success) {
                                    pushReplacement(
                                        context,
                                        const AppCongrats(
                                          title: 'Order Confirmed',
                                          icon: 'check.png',
                                        ));
                                  }
                                },
                                builder: (context, state) {
                               if(state.addOrderRequestState == RequestState.loading){
                               return  Center(child: Container(
                                   margin: EdgeInsets.all(17.sp),
                                   child: CircularProgressIndicator()));
                               } else{
                                 return
                                   AppButton(
                                     bgColor: AppColors.primary,
                                     padding: EdgeInsets.all(12.sp),
                                     margin: EdgeInsets.all(12.sp),
                                     borderRadius:
                                     BorderRadius.circular(13.sp),
                                     onPressed: () async {
                                       orderBloc.add(AddOrderEvent(
                                           OrderData(
                                               addressId: carBloc.state
                                                   .addressEntities!.id)));
                                       setState(() {

                                       });
                                     },
                                     label: "Confirm Order",
                                   );
                               }
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  : const Center(child: Text("No Items in Cart"));
            }
          },
        ),
      ),
    );
  }
}
