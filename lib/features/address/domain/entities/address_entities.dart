
class AddressEntities {
 final  int id;
  bool _selected = false;
 final String name;
 final String city;
 final String region;
 final String details;
 final String notes;
 final String latitude;
 final String longitude;


 bool get selected => _selected;

  set selected(bool value) {
    _selected = value;
  }

  AddressEntities(

      {
bool selected = false,
    required this.id,
    required this.name,
    required this.city,
    required this.region,
    required this.details,
    required this.notes,
    required this.latitude,
    required this.longitude,
  }){
    selected = _selected;
  }
}
