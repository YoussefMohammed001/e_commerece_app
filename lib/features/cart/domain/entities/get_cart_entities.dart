import 'package:e_commerece_app/features/cart/domain/entities/cart_items.dart';

class GetCartDataEntities{

final List<CartItems> cartItemsList;
   num? _total;



 GetCartDataEntities({num? total,required this.cartItemsList}){
    _total = total;
 }

num get total => _total ?? 0;

  set total(num value) {
    _total = value;
  }
}


