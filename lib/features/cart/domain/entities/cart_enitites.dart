import 'package:e_commerece_app/core/enitites/product_details_entities.dart';

class CartEntities{
  final num total;

  CartEntities(this.total);
}

class CartProducts{

  num? _quantity;
 List<ProductDetailsEntities>? _productDetailsEntities;

  CartProducts({ num? quantity,  List<ProductDetailsEntities>? productDetailsEntities}){
    _quantity = quantity;
    _productDetailsEntities = productDetailsEntities;
  }

  List<ProductDetailsEntities> get productDetailsEntities =>
      _productDetailsEntities ?? [];

  num get quantity => _quantity ?? 0;

  set quantity(num value) {
    _quantity = value;
  }
}

