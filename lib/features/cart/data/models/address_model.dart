import 'package:e_commerece_app/features/cart/domain/entities/address_entities.dart';

class AddressModel extends AddressEntities{

  AddressModel({super.city,super.details,super.id,super.name,super.notes,super.region});


  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    name: json['name'],
    id: json['id'],
    city: json['city'],
    details: json['details'],
    notes: json['notes'],
    region: json['region'],
  );



}