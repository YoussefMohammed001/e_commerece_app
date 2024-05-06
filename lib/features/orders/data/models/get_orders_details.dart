import 'package:e_commerece_app/features/orders/domain/entities/orders_entities.dart';

class GetOrdersDetailsModel extends OrderEntities {
  GetOrdersDetailsModel({
    required super.id,
    required super.date,
    required super.discount,
    required super.paymentMethods,
    required super.points,
    super.productDetailsEntities,
    required super.status,
    required super.totalPrice,
     super.orderAddress,
  });


  factory GetOrdersDetailsModel.fromJson(Map<dynamic, dynamic> json) =>
      GetOrdersDetailsModel(
        id: json['id'],
        date: json['date'],
        discount: json['discount'].toString(),
        paymentMethods: json['payment_method'],
        points: json['points'].toString(),
        status: json['status'],
        totalPrice: json['total'].toString(),
        orderAddress: json['address'] != null
            ? OrderAddressModel.fromJson(json['address'])
            : OrderAddressModel.fromJson(json['address']),
        productDetailsEntities: List<OrderProductsModel>.from(
            json['products'].map((e) => OrderProductsModel.fromJson(e))),
      );
}

class OrderAddressModel extends OrderAddress {
  OrderAddressModel(
      {required super.id,
       super.name,
      required super.city,
      required super.region,
      required super.details,
      required super.notes,
      required super.latitude,
      required super.longitude});

  factory OrderAddressModel.fromJson(Map<dynamic, dynamic> json) =>
      OrderAddressModel(
        id: json['id'],
         name: json['name'],
        city: json['city'],
        region: json['region'],
        details: json['details'],
        notes: json['notes'],
        latitude: json['latitude'].toString(),
        longitude: json['longitude'].toString(),
      );
}


class OrderProductsModel extends OrderProductsEntities {
  OrderProductsModel(
      {required super.id,
      required super.quantity,
      required super.price,
      required super.name,
      required super.image});

  factory OrderProductsModel.fromJson(Map<dynamic, dynamic> json) =>
      OrderProductsModel(
          id: json['id'],
          image: json['image'],
          name: json['name'],
          price: json['price'],
          quantity: json['quantity']);
}
