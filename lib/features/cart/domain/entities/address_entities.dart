class AddressEntities{
   int? _id;
   String? _name;
   String? _city;
   String? _region;
   String? _details;
   String? _notes;

   AddressEntities(
       {
         int? id,
         String? name,
         String? city,
         String? region,
         String? details,
         String? notes,
       }){
     _id= id;
     _name =name;
     _city = city;
     _region = region;
     _details = details;
     _notes = notes;
   }

   String get notes => _notes ?? "";

  set notes(String value) {
    _notes = value;
  }

  String get details => _details ?? "";

  set details(String value) {
    _details = value;
  }

  String get region => _region?? "";

  set region(String value) {
    _region = value;
  }

  String get city => _city?? "";

  set city(String value) {
    _city = value;
  }

  String get name => _name ?? "";

  set name(String value) {
    _name = value;
  }

  int get id => _id ?? 0;

  set id(int value) {
    _id = value;
  }
}