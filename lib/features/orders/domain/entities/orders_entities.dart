import 'package:e_commerece_app/core/enitites/product_details_entities.dart';

class OrderEntities{
  int id = 0;
  String date = "";
  String totalPrice = "";
  String status  = "";
  String discount = "";
  String points = "";
  String paymentMethods = "";
  List<OrderProductsEntities> productDetailsEntities = [];
  OrderAddress? orderAddress;
  OrderEntities(
      {
         this.id = 0,
       this.date = "",
       this.totalPrice = "",
       this.status = "",
       this.discount = "",
       this.points = "",
       this.paymentMethods = "",
       this.productDetailsEntities = const [],
        this.orderAddress,
      });
}

class OrderProductsEntities {
int id;
int quantity;
int price;
String name;
String image;

OrderProductsEntities(
    {
      required this.id,
      required this.quantity,
      required this.price,
      required this.name
      , required this.image
    });
}


class OrderAddress{
  int id;
  String name = "";
  String city;
  String region;
  String details;
  String notes;
  String latitude;
  String longitude;

  OrderAddress(

      {
        required this.id,
         this.name = "",
      required this.city,
      required this.region,
      required this.details,
      required this.notes,
      required this.latitude,
      required this.longitude});
}