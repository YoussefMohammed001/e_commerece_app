
class AddComplaintsModel   {
 String _name = "";
 String _phone = "";
 String _email = "";
 String _message = "";

 AddComplaintsModel({required String name,required String phone,
   required String email, required String message
 }){

_name = name;
_email = email;
_phone = phone;
_message = message;
 }
 toJson(){
   final json = <String, dynamic>{};
   json['name'] = _name;
   json['email'] = _email;
   json['phone'] = _phone;
   json['message'] = _message;
 }

 String get message => _message;

  String get email => _email ;

  String get phone => _phone ;

  String get name => _name;
}