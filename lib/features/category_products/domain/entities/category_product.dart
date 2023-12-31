import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CategoryProductsEntities extends Equatable{

  CategoryProductsEntities({
    num? id,
    num? price,
    num? oldPrice,
    num? discount,
    String? image,
    String? name,
    String? description,
    List<String>? images,
    bool? inFavorites,
    bool? inCart,}) {
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
  }

  num? _id;
  num? _price;
  num? _oldPrice;
  num? _discount;
  String? _image;
  String? _name;
  String? _description;
  List<String>? _images;
  bool? _inFavorites;
  bool? _inCart;

  num get id => _id ?? 02121;

  num get price => _price ?? 0;

  num get oldPrice => _oldPrice ?? 0;

  num get discount => _discount ?? 0;

  String get image => _image ?? "";

  String get name => _name ?? "";

  String get description => _description ?? "";

  List<String> get images => _images ?? [];

  bool get inFavorites => _inFavorites ?? false;

  bool get inCart => _inCart ?? false;


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