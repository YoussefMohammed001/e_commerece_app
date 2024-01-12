import 'package:e_commerece_app/features/cart/domain/entities/cart_items.dart';

class UpdateOrDeleteCartEntities{
  UpdateOrDeleteCartEntities({ num? total, required this.cartItems}){
    _total = total;
  }


  final CartItems cartItems;
   num? _total;


  num get total => _total ?? 0;

  set total(num value) {
    _total = value;
  }
}