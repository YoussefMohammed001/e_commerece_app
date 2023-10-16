import 'package:equatable/equatable.dart';

class HomeCategories extends Equatable{
 final  int id;
  final String imageUrl;
  final String name;

 const HomeCategories( { required this.name,required this.id, required this.imageUrl});

  @override
  List<Object?> get props => [
    id,
    imageUrl,
    name,
  ];

}