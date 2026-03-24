import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.low,
    distanceFilter: 100,
  );

  Future<void> getCurrentLocation() async {
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
    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );
      latitude = position.latitude;
      longitude = position.longitude;
    }
    catch(e)
    {
      print(e);
    }
  }

}

