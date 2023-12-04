
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:piano_app/weather.dart';

class networkHandler {
  String _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  String _apiKey = '9c5a004f619444b468e4d501bd01553b';


  String getlocationUrl(double lat, double lon) {
    return '$_baseUrl? lat=$lat&lon=$lon&appid=$_apiKey';
  }


  Future<Weather?> getWeatherResultfromGps(double lat, double lon) async {
    Weather _weather = Weather();
    try {
      var response = await http.get(Uri.parse(getlocationUrl(lat, lon)));
      print(response.body);

      //convert this json format  to map
      var result = json.decode(response.body);
      print(result);
      _weather.description = result['weather'][0]['description'];
      _weather.locationName = result['name'];
      _weather.temperature = result['main']['temp'].toString();
      _weather.wind = result['wind']['speed'].toString();
      _weather.humidity = result['main']['humidity'].toString();

      return _weather;
    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }

  String getCityname(String Cityname) {
    return '$_baseUrl? q=$Cityname&appid=$_apiKey';
  }

  Future<Weather?> getWeatherResultfromCityname(String q) async {
    Weather _weather = Weather();
    try {
      var response = await http.get(Uri.parse(getCityname(q)));
      print(response.body);

      //convert this json format  to map
      var result = json.decode(response.body);
      print(result);
     _weather.description = result['weather'][0]['description'];
      _weather.locationName = result['name'];
      _weather.temperature = result['main']['temp'].toString();
      _weather.wind = result['wind']['speed'].toString();
      _weather.humidity = result['main']['humidity'].toString();



      return _weather;
    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }
}
