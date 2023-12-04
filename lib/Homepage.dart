import 'package:flutter/material.dart';
import 'package:piano_app/Cityname.dart';
import 'package:piano_app/weather.dart';

class Homescreen extends StatefulWidget {
  final Weather weather;
  Homescreen({required this.weather});
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String description ='';
  String conditionImage = '';

  String locationName = '';
  String temperature = '';
  String wind = '';
  String humidity = '';

  @override
  void initState() {
   updateui();
    super.initState();
  }

  void updateui(){
    setState(() {

    description=widget.weather.description;
    locationName=widget.weather.locationName;
    temperature=widget.weather.temperature;
    wind=widget.weather.wind;
    humidity=widget.weather.humidity;
    });
  }


  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.orangeAccent,
        body: SafeArea(
          child: Column(children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 100)),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [

        Text(description , style: TextStyle(fontSize: 25, color: Colors.white)),

              IconButton(
                iconSize: 50,
                color: Colors.white,
                icon: const Icon(Icons.map),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Cityname()));
                },
              ),
            ]),
            Expanded(
                flex: 3,
                child: Center(
                  child: Image(
                    image: AssetImage('assets/016-thermometer.png'),
                    width: MediaQuery.of(context).size.width / 2,
                  ),
                )),
            Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 33,
                        ),
                        Text(
                          '${locationName}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${temperature}°C',
                            style: TextStyle(color: Colors.white, fontSize: 55),
                          ),
                          Center(
                            child: Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Card(
                                    elevation: 20,
                                    child: Text('Wind\n${wind} ms',style: TextStyle(fontSize: 33),),
                                  ),
                                )),
                          ),
                          Center(
                            child: Expanded(
                                child: Card(
                                  elevation: 20,
                                  child: Text('Humidity \n${humidity} ms',style: TextStyle(fontSize: 33),),
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ]),
        ),
      ),
    );
  }
}
