class Weather{
  String _description='';
  String _temperature='';
  String _conditionImage='';
  String _locationName='';
  String _wind='';
  String _humidity='';

  String get description => _description;
  set description(String value){
    _description=value;
  }
 String get conditioniImage => _conditionImage;
  set conditionImage(String value){
    _conditionImage=value;
  }
  String get locationName=> _locationName;
  set locationName(String value){
    _locationName=value;
  }
  String get wind => _wind;
  set wind(String value){
    _wind=value;
  }
  String get humidity=> _humidity;
  set humidity(String value){
    _humidity=value;
  }
  String get temperature=> _temperature.toString();
  set temperature(String value){
    _temperature=value;
  }
}