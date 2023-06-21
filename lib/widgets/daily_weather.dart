import 'package:flutter/material.dart';
import 'package:flutterassessment/screens/weather_details_screen.dart';
import 'package:flutterassessment/widgets/weather_details.dart';
import 'package:provider/provider.dart';

import '../providers/weather_provider.dart';

class DailyWeather extends StatefulWidget {
  @override
  State<DailyWeather> createState() => _DailyWeatherState();
}

class _DailyWeatherState extends State<DailyWeather> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, weatherProvider, _) {
        final weather = weatherProvider.dailyData; // Access daily weather using dailyData instead of daily
        return WeatherDetailsWidget(details: weather);
      },
    );
  }
}
