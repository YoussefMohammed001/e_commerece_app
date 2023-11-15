import 'package:e_commerece_app/core/enitites/product_details_entities.dart';
import 'package:e_commerece_app/features/saved_items/domain/entities/fav_entities.dart';

class BaseFavModel extends BaseFavEntities{
  BaseFavModel(
      {required super.id, required super.favEntities,

     });


  factory BaseFavModel.fromJson(Map<String, dynamic> json) =>
      BaseFavModel(
        id: json['id'],
    favEntities: json['product'] != null ? FavModel.fromJson(json['product']) : FavModel.fromJson(json['product']),

      );
}

class FavModel extends ProductDetailsEntities{

      FavModel({
            required super.id,
            required super.name,
            required super.description,
            required super.price,
            required super.oldPrice,
            required super.discount,
            required super.image,
            required super.inCart,
            required super.inFavorites,
      });


      factory FavModel.fromJson(Map<String, dynamic> json) =>
          FavModel(
            id: json['id'],
            price: json['price'],
            oldPrice: json['old_price'],
            discount: json['discount'],
            name: json['name'],
            description: json['description'],
            inFavorites: json['in_favorites'],
            inCart: json['in_cart'], image: json['image'],
          );

}