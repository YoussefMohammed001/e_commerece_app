part of 'category_products_bloc.dart';

@immutable
abstract class BaseCategoryProductsEvent {}
class CategoryProductsEvent extends BaseCategoryProductsEvent{
  final String id;

  CategoryProductsEvent({required this.id});
}