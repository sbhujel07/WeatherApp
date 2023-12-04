import 'package:geolocator/geolocator.dart';

class Userlocation{
  Future<Position> getUserposition() async{
    return await Geolocator.getCurrentPosition();
  }
}