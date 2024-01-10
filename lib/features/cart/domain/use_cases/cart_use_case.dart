import 'package:e_commerece_app/features/cart/data/models/cart_data_request.dart';
import 'package:e_commerece_app/features/cart/domain/entities/get_cart_entities.dart';
import 'package:e_commerece_app/features/cart/domain/entities/update_or_delete_cart_entites.dart';
import 'package:e_commerece_app/features/cart/domain/repositories/base_cart_repo.dart';
import 'package:either_dart/either.dart';

class CartUseCase{
  final BaseCartRepo baseCartRepo;
  CartUseCase(this.baseCartRepo);

  Future<Either<String,GetCartDataEntities>> getCart() async {
    return await  baseCartRepo.getCart();
}

Future<Either<String,String>> addCart({required CartDataRequest cartDataRequest}) async {
    return await  baseCartRepo.addToCart(cartDataRequest: cartDataRequest);
}

Future<Either<String,UpdateOrDeleteCartEntities>> updateOrDeleteCart({required CartDataRequest cartDataRequest}) async {
    return await  baseCartRepo.updateOrDeleteCart(cartDataRequest: cartDataRequest);
}




}