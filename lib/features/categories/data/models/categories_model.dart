import 'package:e_commerece_app/features/categories/domain/entities/categories.dart';

class CategoriesModel extends Categories{
const  CategoriesModel( {required super.name, required super.id, required super.imageUrl});

  factory CategoriesModel.fromJson(Map<String,dynamic> json) => CategoriesModel(
name: json['name'],
    id: json['id'],
    imageUrl: json['image'],


  );
}