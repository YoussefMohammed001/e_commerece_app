import 'package:e_commerece_app/features/home/domain/entities/banners.dart';

class HomeBannersModel extends Banners{
  const  HomeBannersModel( {required super.id, required super.imageUrl});

  factory HomeBannersModel.fromJson(Map<String,dynamic> json) => HomeBannersModel(

    id: json['id'],
    imageUrl: json['image'],


  );
}