import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ProductDetailsEntities extends Equatable {
  ProductDetailsEntities(
      {
    num? id,
        num? quantity,
    num? price,
    num? oldPrice,
    num? discount,
    String? image,
    String? name,
    String? description,
    List<dynamic>? images,
    bool? inFavorites,
    bool? inCart,
      }
      
      )
  {
    _id = id;
    _price = price;
    _oldPrice = oldPrice;
    _discount = discount;
    _image = image;
    _name = name;
    _description = description;
    _images = images;
    _inFavorites = inFavorites;
    _inCart = inCart;
    _quantity = quantity;
  }
  num? _quantity;
  num? _id;
  num? _price;
  num? _oldPrice;
  num? _discount;
  String? _image;
  String? _name;
  String? _description;
  List<dynamic>? _images;
  bool? _inFavorites;
  bool? _inCart;

  num get quantity => _quantity ?? 0;

  num get id => _id ?? 0;

  num get price => _price ?? 0;

  num get oldPrice => _oldPrice ?? 0;

  num get discount => _discount ?? 0;

  String get image => _image ?? "";

  String get name => _name ?? "";

  String get description => _description ?? "";

  List<dynamic> get images => _images ?? [];

  bool get inFavorites => _inFavorites ?? false;

  bool get inCart => _inCart ?? false;


  set inCart(bool value) {
    _inCart = value;
  }

  set inFavorites(bool value) {
    _inFavorites = value;
  }


  @override
  List<Object> get props => [
    id,
    name,
    description,
    price,
    oldPrice,
    description,
    discount,
    inCart,
    inFavorites,
    images,

  ];

}
