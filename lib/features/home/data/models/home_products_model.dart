
// ignore: must_be_immutable
import 'package:e_commerece_app/core/enitites/product_details_entities.dart';

class HomeProductsModel extends ProductDetailsEntities {
  HomeProductsModel(
      {required super.id,

      required super.image,
      required super.price,
      required super.oldPrice,
      required super.discount,
      required super.name,
      required super.description,
      required super.inFavorites,
      required super.inCart});


  factory HomeProductsModel.fromJson(Map<String, dynamic> json) =>
      HomeProductsModel(
        id: json['id'],
        image: json['image'],
        price: json['price'],
        oldPrice: json['old_price'],
        discount: json['discount'],
        name: json['name'],
        description: json['description'],
        inFavorites: json['in_favorites'],
        inCart: json['in_cart'],
      );


}
