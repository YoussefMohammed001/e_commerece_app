import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class LoginEntities extends Equatable {
  final String email;
  final String mobile;
  final String name;
  final int id;
  final String image;
  final String token;

  LoginEntities(
      {required this.email,
      required this.mobile,
      required this.name,
      required this.id,
      required this.image,
      required this.token,
      });

  @override
  List<Object?> get props => [
        id,
        email,
        name,
        mobile,
        image,
        token,

      ];
}
