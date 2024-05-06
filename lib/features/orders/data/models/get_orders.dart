import 'package:e_commerece_app/features/orders/domain/entities/orders_entities.dart';

class OrdersModel extends OrderEntities{
  OrdersModel({required super.id});


  factory OrdersModel.fromJson(Map<String,dynamic> json) =>
      OrdersModel(
          id: json['id'],
        );




}