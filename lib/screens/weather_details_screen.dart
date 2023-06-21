import 'package:flutter/material.dart';
import 'package:flutterassessment/models/weather.dart';

import '../widgets/weather_details.dart';

class WeatherDetails extends StatelessWidget {
  final Weather details;

  const WeatherDetails({required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Details'),
      ),
      body: WeatherDetailsWidget(details: details),
    );
  }
}
