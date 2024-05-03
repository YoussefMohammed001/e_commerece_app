class FAQsModel{
  String _q = "q";
  String _ans = "a";

  FAQsModel(this._q, this._ans);


  FAQsModel.fromJson(Map<String,dynamic> json){
    _q  = json['question'] ;
    _ans = json['answer'];
  }

  String get ans => _ans;

  String get q => _q;
}
