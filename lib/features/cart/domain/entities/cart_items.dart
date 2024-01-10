
import 'package:e_commerece_app/core/enitites/product_details_entities.dart';

class CartItems {
  final int id;
  final int quantity;
  final ProductDetailsEntities productDetailsEntities;

  CartItems({required this.id, required this.quantity, required this.productDetailsEntities});
}