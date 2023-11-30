import 'package:e_commerece_app/core/enitites/product_details_entities.dart';

class CartEntities{
   num? _total;
final List<CartItems> cartItems;
  CartEntities({ num? total, required this.cartItems,}) {
    _total = total;
  }

   num get total => _total ?? 0;

  set total(num value) {
    _total = value;
  }
}

class UpdateDeleteCartEntities{
   num? _total;
final CartItems cartItems;

  UpdateDeleteCartEntities({ num? total, required this.cartItems,}){
    _total = total;
  }

   num get total => _total ?? 0;

  set total(num value) {
    _total = value;
  }
}



class CartItems{
int? _id;
int? _quantity;
ProductDetailsEntities? _productDetailsEntities;

  CartItems({ int? quantity,int? id,  ProductDetailsEntities? productDetailsEntities}){
    _quantity = quantity;
     _id = id;
    _productDetailsEntities = productDetailsEntities;
  }

  ProductDetailsEntities get productDetailsEntities =>
      _productDetailsEntities ?? ProductDetailsEntities();

int get id => _id ?? 0;

int get quantity => _quantity ?? 0;

set id(int value) {
    _id = value;
  }

  set quantity(int value) {
    _quantity = value;
  }
}

