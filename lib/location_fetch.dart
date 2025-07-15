import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationFetch extends StatefulWidget {
  const LocationFetch({ Key? key }) : super(key: key);

  @override
  _LocationFetchState createState() => _LocationFetchState();
}

class _LocationFetchState extends State<LocationFetch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocaton();
  }

  getCurrentLocaton() async {
    // Geolocator.openAppSettings();

    LocationPermission  permission = await Geolocator.requestPermission();
    if(permission == LocationPermission.denied){
       await Geolocator.openLocationSettings();
      return Future.error("Location Permission Denied");

    }

    Position position = await Geolocator.getCurrentPosition();
    print("Latitude: ${position.latitude}");
    print("Longitude: ${position.longitude}");



  }
}