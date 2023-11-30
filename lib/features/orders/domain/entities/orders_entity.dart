import 'package:equatable/equatable.dart';

class OrdersEntities extends Equatable {
  final int id;
  final num total;
  final String status;
  final String date;

  const OrdersEntities({required this.id, required this.date,required this.total, required this.status});

  @override
  List<Object> get props => [id, total, status];
}