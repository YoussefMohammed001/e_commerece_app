import 'package:e_commerece_app/features/home/domain/entities/categories.dart';

class HomeCategoriesModel extends HomeCategories {
  const HomeCategoriesModel({
    required super.name,
    required super.id,
    required super.imageUrl,
  });

  factory HomeCategoriesModel.fromJson(Map<String, dynamic> json) =>
      HomeCategoriesModel(
        name: json['name'],
        id: json['id'],
        imageUrl: json['image'],
      );
}
