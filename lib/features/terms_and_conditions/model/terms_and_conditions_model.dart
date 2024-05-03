class TermsAndConditionsModel{
  String _about= "q";
  String _terms = "a";

  TermsAndConditionsModel(this._about, this._terms);


  TermsAndConditionsModel.fromJson(Map<String,dynamic> json){
    _about  = json['about'] ;
    _terms= json['terms'];
  }

  String get terms => _terms;

  String get about => _about;
}
