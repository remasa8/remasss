class Rigistermodel
{
  bool status;
  String message;
  Rigistermodel({required this.status , required this.message});
  factory Rigistermodel.fromjson(Map json)
  {
    return Rigistermodel(status: json["status"], message: json["message"]);
  }
}