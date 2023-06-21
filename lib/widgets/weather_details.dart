import 'package:flutter/material.dart';
import '../models/weather.dart';

class WeatherDetailsWidget extends StatelessWidget {
  final Weather details;

  const WeatherDetailsWidget({required this.details});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              details.icon,
              width: 100,
              height: 100,
            ),
            SizedBox(height: 16),
            Text(
              'Date: ${details.date}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Title: ${details.title}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Sunrise: ${details.sunrise}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Sunset: ${details.sunset}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Average Temperature: ${details.avgtemp_c}°C',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            // Add more details here if needed
          ],
        ),
      ),
    );
  }
}
