part of 'product_details_bloc.dart';

abstract class BaseProductDetailsEvent {}


class ProductDetailsEvent extends BaseProductDetailsEvent{
  final int id;

  ProductDetailsEvent(this.id);
}

