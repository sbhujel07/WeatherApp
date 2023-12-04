import 'package:flutter/material.dart';

class Cityname extends StatefulWidget {
  const Cityname({super.key});

  @override
  State<Cityname> createState() => _CitynameState();
}

class _CitynameState extends State<Cityname> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CityName'),
      ),
      body:Column(

        children: [
           TextField(
            decoration: InputDecoration(
              hintText: 'enter the cityname'
            ),


          ),
        ],

      ),
      );
  }
}
