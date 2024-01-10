import 'package:e_commerece_app/features/cart/domain/entities/cart_items.dart';

class UpdateOrDeleteCartEntities{

  final CartItems cartItems;
  final num total;
  UpdateOrDeleteCartEntities({required this.total, required this.cartItems});
  

}