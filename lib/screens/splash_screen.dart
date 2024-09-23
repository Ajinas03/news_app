import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:news_app/providers/weather_provider.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final String _locationMessage = "";

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  void initState() {
    _getCurrentLocation();

    super.initState();
  }

  _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // setState(() {
      //   _locationMessage = 'Location services are disabled.';
      // });
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // setState(() {
        //   _locationMessage = 'Location permissions are denied';
        // });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      context.read<WeatherProvider>().getWeather(position: position);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
    } catch (e) {
      // setState(() {
      //   _locationMessage = "Couldn't get the location: $e";
      // });
    }
  }
}
