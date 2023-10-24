import 'package:e_commerece_app/features/category_products/domain/entities/category_product.dart';

// ignore: must_be_immutable
class CategoryProductsModel extends CategoryProductsEntities {
  CategoryProductsModel(
      {required super.id,

        required super.image,
        required super.price,
        required super.oldPrice,
        required super.discount,
        required super.name,
        required super.description,
        required super.inFavorites,
        required super.inCart});


  factory CategoryProductsModel.fromJson(Map<String, dynamic> json) =>
       CategoryProductsModel(
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
