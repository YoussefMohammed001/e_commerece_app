import 'package:e_commerece_app/features/cart/domain/entities/cart_enitites.dart';
import 'package:e_commerece_app/features/saved_items/data/model/fav_model.dart';

class GetCartModel extends CartEntities {
  GetCartModel({required super.total, required super.cartItems,});

  factory GetCartModel.fromJson(Map<String, dynamic> json) => GetCartModel(
        total: json['sub_total'],

        cartItems: List<CartModel>.from(
            json['cart_items'].map((e) => CartModel.fromJson(e))),

      );
}

class DeleteUpdateCartModel extends UpdateDeleteCartEntities {
  DeleteUpdateCartModel({required super.total, required super.cartItems,});

  factory DeleteUpdateCartModel.fromJson(Map<String, dynamic> json) => DeleteUpdateCartModel(
    total: json['sub_total'],
    cartItems:CartModel.fromJson(json['cart']),


  );
}



class CartModel extends CartItems {
  CartModel({super.productDetailsEntities, super.quantity,super.id});
  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        productDetailsEntities: json['product'] != null
            ? FavModel.fromJson(json['product'])
            : FavModel.fromJson(json['product']),
        quantity: json['quantity'],
    id:json['id'],
      );
}


