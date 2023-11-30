import 'package:e_commerece_app/features/cart/data/models/address_model.dart';
import 'package:e_commerece_app/features/orders/domain/entities/order_details_entities.dart';
import 'package:e_commerece_app/features/product_details/data/models/product_details_model.dart';

class OrderDetailsModel extends OrderDetailsEntity{
  const OrderDetailsModel({required super.addressEntities, required super.cartEntities, required super.id, required super.cost, required super.total, required super.discount, required super.points, required super.date, required super.status, required super.paymentMethod, required super.promoCode});


  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) => OrderDetailsModel(

      addressEntities: AddressModel.fromJson(json['address']),
      cartEntities:List<ProductDetailsModel>.from(
          json['products'].map((e) => ProductDetailsModel.fromJson(e))) ,
      id: json['id'],
      cost: json['cost'],
      total: json['total'],
      discount: json['discount'],
      points: json['points'],
      date: json['date'],
      status: json['status'],
      paymentMethod: json['payment_method'],
      promoCode: json['promo_code']);
}