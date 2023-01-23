class Whether{
  double temperature_c;
  double temperature_f;
  String condition;

  Whether({
    this.temperature_c=0,
    this.temperature_f=0,
    this.condition='Sunny',

});
  factory Whether.fromJson(Map<String,dynamic> json){
    return Whether(
      temperature_c: json["current"]["temp_c"],
      temperature_f: json["current"]["temp_f"],
      condition: json["current"]["condition"]["text"],
    );
  }
}
