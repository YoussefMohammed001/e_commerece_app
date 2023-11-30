import 'package:e_commerece_app/features/cart/data/models/request_data.dart';
import 'package:e_commerece_app/features/cart/domain/entities/cart_enitites.dart';
import 'package:e_commerece_app/features/cart/domain/repositories/base_cart_repo.dart';
import 'package:either_dart/either.dart';

class CartUseCase{
  final BaseCartRepo baseCartRepo;

  CartUseCase(this.baseCartRepo);

  Future<Either<String,CartEntities>> callGet() async {
    return await baseCartRepo.getCart();
}


Future<Either<String,String>> callPost({required CarRequestData requestData}) async {
    return await baseCartRepo.postCart(requestData: requestData);
}

Future<Either<String,UpdateDeleteCartEntities>> callUpdate({required CarRequestData requestData}) async {
    return await baseCartRepo.updateCart(requestData: requestData);

}

Future<Either<String,UpdateDeleteCartEntities>> callDelete({required CarRequestData requestData}) async {
    return await baseCartRepo.delete(requestData: requestData);

}
}