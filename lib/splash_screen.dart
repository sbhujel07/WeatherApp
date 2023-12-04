
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:piano_app/Homepage.dart';
import 'package:piano_app/services/locationService.dart';
import 'package:piano_app/services/networkHandler.dart';
import 'package:piano_app/weather.dart';

class Splashscreen extends StatefulWidget {

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  String description='';
  String conditionImage = '';
  String locationName = '';
  String temperature = '';
  String wind = '';
  String humidity = '';

  @override
  void initState() {
    requestweather();
    super.initState();
  }

  void requestweather() async{

  try{
    networkHandler _networkHandler= networkHandler();
    Userlocation _Userlocation= Userlocation();
    Position _Position =await Geolocator.getCurrentPosition();

     if(_Position!=null){
       Weather? _weather =
       await _networkHandler.getWeatherResultfromGps(_Position.latitude,_Position.longitude);
       Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen(weather: _weather!)));

     }
     else{
       print('position is null');
     }

  }
  catch(e){
    print('Something went wrong');
  }

  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'loading weather data',
              style: TextStyle(fontSize: 22),
            ),
            SpinKitPouringHourGlass(
              color: Colors.red,
              size: 100.0,
            ),
          ],
        ),
      ),
    );
  }
}
