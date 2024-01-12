
import 'package:e_commerece_app/core/enitites/product_details_entities.dart';

class CartItems {
  final int id;
   int? _quantity;
  final ProductDetailsEntities productDetailsEntities;

  CartItems({required this.id,  int? quantity, required this.productDetailsEntities}){
    _quantity = quantity;
  }

  int get quantity => _quantity ?? 0;

  set quantity(int value) {
    _quantity = value;
  }
}