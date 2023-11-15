import 'package:e_commerece_app/features/home/domain/entities/banners.dart';
import 'package:e_commerece_app/features/home/domain/repositories/base_home_repository.dart';
import 'package:either_dart/either.dart';

class HomeBannersUseCase{
  final BaseHomeRepository baseHomeRepository;
  HomeBannersUseCase(this.baseHomeRepository);


  Future<Either<String , List<Banners>>>  execute({required int pageNumber}) async {
    return await baseHomeRepository.getHomeBanners(pageNumber: pageNumber);
  }

}