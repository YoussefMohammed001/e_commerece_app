import 'package:e_commerece_app/features/cart/data/models/cart_model.dart';
import 'package:e_commerece_app/features/cart/domain/entities/get_cart_entities.dart';
class GetCartModel extends GetCartDataEntities {
  GetCartModel({required super.total, required super.cartItemsList});


  factory GetCartModel.fromJson(Map<String, dynamic> json) => GetCartModel(
    total: json['sub_total'],

    cartItemsList: List<CartModel>.from(
        json['cart_items'].map((e) => CartModel.fromJson(e))),

  );
}




