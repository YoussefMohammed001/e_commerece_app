import 'package:e_commerece_app/features/address/domain/entities/address_entities.dart';

class AddressRequest extends AddressEntities{
  AddressRequest({required super.id, required super.name, required super.city, required super.region, required super.details, required super.notes, required super.latitude, required super.longitude});
  toJson(){
    final json = <String, dynamic>{};
      json['name'] = name;
      json['city'] = city;
      json['region'] = region;
      json['details'] =details;
      json['notes'] = notes;
      json['latitude'] = 213.11;
      json['longitude'] = 21.21;
    return json;
  }


}