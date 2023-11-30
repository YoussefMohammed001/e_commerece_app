import 'package:e_commerece_app/core/enitites/product_details_entities.dart';

// ignore: must_be_immutable
class ProductDetailsModel extends ProductDetailsEntities{
  ProductDetailsModel(
      {
        required super.quantity,
            required super.image,
        required super.id,
        required super.images,
        required super.price,
        required super.oldPrice,
        required super.discount,
        required super.name,
        required super.description,
        required super.inFavorites,
        required super.inCart,
      });


  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        id: json['id'],
        images: json['images'],
        price: json['price'],
        oldPrice: json['old_price'],
        discount: json['discount'],
        name: json['name'],
        description: json['description'],
        inFavorites: json['in_favorites'],
        inCart: json['in_cart'], image: json['image'], quantity: json['quantity'],
      );



}