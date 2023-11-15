import 'package:e_commerece_app/core/enitites/product_details_entities.dart';
import 'package:equatable/equatable.dart';


class BaseFavEntities extends Equatable{

  final int id;
  final ProductDetailsEntities favEntities;


  BaseFavEntities({required this.id, required this.favEntities});

  @override
  // TODO: implement props
  List<Object?> get props => [];

}
