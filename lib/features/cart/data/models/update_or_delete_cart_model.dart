import 'package:e_commerece_app/features/cart/data/models/cart_model.dart';
import 'package:e_commerece_app/features/cart/domain/entities/update_or_delete_cart_entites.dart';
class UpdateOrDeleteCartModel extends UpdateOrDeleteCartEntities {
  UpdateOrDeleteCartModel({required super.total, required super.cartItems});

  factory UpdateOrDeleteCartModel.fromJson(Map<String, dynamic> json) => UpdateOrDeleteCartModel(
    total: json['total'],
    cartItems:CartModel.fromJson(json['cart']),


  );
}
