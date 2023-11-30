import 'package:e_commerece_app/core/enitites/product_details_entities.dart';
import 'package:e_commerece_app/features/cart/domain/entities/address_entities.dart';
import 'package:equatable/equatable.dart';

class OrderDetailsEntity extends Equatable {
  final AddressEntities addressEntities;
  final List<ProductDetailsEntities> cartEntities;
  final int id;
  final num cost, total, discount, points;
  final String date, status, paymentMethod, promoCode;

 const  OrderDetailsEntity({required this.addressEntities,
    required this.cartEntities,
    required this.id,
    required this.cost,
    required this.total,
    required this.discount,
    required this.points,
    required this.date,
    required this.status,
    required this.paymentMethod,
    required this.promoCode});

  @override
  List<Object> get props => [addressEntities, cartEntities, id, cost, date,];

}