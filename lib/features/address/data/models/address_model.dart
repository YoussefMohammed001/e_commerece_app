import 'package:e_commerece_app/features/address/domain/entities/address_entities.dart';

class AddressModel extends AddressEntities {
  AddressModel(
      {required super.id,
      required super.name,
      required super.city,
      required super.region,
      required super.details,
      required super.notes,
      required super.latitude,
      required super.longitude});

  toJson(){
    final json = <String, dynamic>{};

    json['name'] = name;
    json['city'] = city;
    json['region'] = region;
    json['details'] =details;
    json['notes'] = notes;
    json['latitude'] = 213.11;
    json['longitude'] = 122.1;
    return json;
  }

  factory AddressModel.fromJson(Map<dynamic, dynamic> json) => AddressModel(
        id: json['id'],
        name: json['name'],
        city: json['city'],
        region: json['region'],
        details: json['details'],
        notes: json['notes'],
        latitude: json['latitude'].toString(),
        longitude: json['longitude'].toString(),
      );
}
