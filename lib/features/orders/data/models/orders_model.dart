import 'package:e_commerece_app/features/orders/domain/entities/orders_entity.dart';

class OrdersModel extends OrdersEntities{
  OrdersModel({required super.id, required super.total, required super.status, required super.date});


  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
      id: json['id'],
      total:  json['total'],
      status: json['status'],
      date: json['date']
  );
}