import 'package:e_commerece_app/features/cart/domain/entities/cart_items.dart';
import 'package:e_commerece_app/features/saved_items/data/model/fav_model.dart';

class CartModel extends CartItems {
  CartModel({required super.id, required super.quantity, required super.productDetailsEntities});
  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    productDetailsEntities: json['product'] != null
        ? FavModel.fromJson(json['product'])
        : FavModel.fromJson(json['product']),
    quantity: json['quantity'],
    id:json['id'],
  );
}
