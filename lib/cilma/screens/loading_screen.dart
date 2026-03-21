import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.low,
    distanceFilter: 100,
  );

  void getCurrentLocation() async {
    LocationPermission permission;

    // 1. Check current permission
    permission = await Geolocator.checkPermission();

    // 2. Request if denied
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // 3. Handle denied cases
    if (permission == LocationPermission.denied) {
      print('Permission denied');
      return;
    }

    if (permission == LocationPermission.deniedForever) {
      print('Permission permanently denied');
      await Geolocator.openAppSettings(); // optional
      return;
    }

    // 4. NOW get location ✅
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: locationSettings,
    );
    print(position);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.blue,
          child: TextButton(
            onPressed: () {
              getCurrentLocation();
            },
            child: Text('Get Location'),
          ),
        ),
      ),
    );
  }
}
