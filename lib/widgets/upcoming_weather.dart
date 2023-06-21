import 'package:flutter/material.dart';
import 'package:flutterassessment/screens/weather_details_screen.dart';
import 'package:provider/provider.dart';

import '../providers/weather_provider.dart';

class UpcomingWeather extends StatefulWidget {
  const UpcomingWeather({Key? key}) : super(key: key);

  @override
  State<UpcomingWeather> createState() => _UpcomingWeatherState();
}

class _UpcomingWeatherState extends State<UpcomingWeather> {
  @override


  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, weatherProvider, _) {
        final weatherList = weatherProvider.items;
        return ListView.builder(
          itemCount: weatherList.length,
          itemBuilder: (context, index) {
            final weather = weatherList[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WeatherDetails(details: weather),
                  ),
                );
              },
              child: ListTile(
                leading: Image.network(weather.icon), // Display weather icon
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(weather.date), // Display day
                    Text(weather.title), // Display day
                    Text('Sunrise: ${weather.sunrise}'), // Display sunrise time
                    Text('Sunset: ${weather.sunset}'), // Display sunset time
                  ],
                ),
                trailing: RichText(
                  text: TextSpan(
                    text: '${weather.avgtemp_c}°C', // Display average temperature in Celsius
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                // Customize the ListTile as per your UI requirements
              ),
            );
            // return
          },
        );
      },
    );
  }
}
