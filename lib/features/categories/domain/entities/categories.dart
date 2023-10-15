import 'package:equatable/equatable.dart';

class Categories extends Equatable{
 final  int id;
  final String imageUrl;
  final String name;

 const Categories( { required this.name,required this.id, required this.imageUrl});

  @override
  List<Object?> get props => [
    id,
    imageUrl,
  ];

}