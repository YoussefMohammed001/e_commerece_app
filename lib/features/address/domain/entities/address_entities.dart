
class AddressEntities {
  bool _selected = false;
    int _id = 0;
   String _name = "";
  String _city  = "";
  String _region  = "";
  String _details  = "";
  String _notes  = "";
  String _latitude  = "";
  String _longitude  = "";


 bool get selected => _selected;

  set selected(bool value) {
    _selected = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  AddressEntities(
      {
         bool selected = false,
         int id = 0,
         String name = "",
         String city = "" ,
         String region = "",
         String details = "",
         String notes = "",
         String latitude = "",
         String longitude = "",
  }){
    _selected = selected;
     _id = id;
    _name = name;
     _city = city;
     _region = region;
     _details = details;
     _notes = notes;
     _latitude = latitude;
     _longitude = longitude;

  }

  String get name => _name;

  String get longitude => _longitude;

  set longitude(String value) {
    _longitude = value;
  }

  String get latitude => _latitude;

  set latitude(String value) {
    _latitude = value;
  }

  String get notes => _notes;

  set notes(String value) {
    _notes = value;
  }

  String get details => _details;

  set details(String value) {
    _details = value;
  }

  String get region => _region;

  set region(String value) {
    _region = value;
  }

  String get city => _city;

  set city(String value) {
    _city = value;
  }

  set name(String value) {
    _name = value;
  }
}
