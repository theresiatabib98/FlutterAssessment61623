import 'package:flutter/material.dart';
import 'package:flutterassessment/providers/weather_provider.dart';
import 'package:provider/provider.dart';

import 'screens/weather_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: WeatherProvider(),
          ),
        ],
        child: MaterialApp(
            title: 'Weather',
            theme: ThemeData(
              primarySwatch: Colors.amber,
              secondaryHeaderColor: Colors.black26,
              fontFamily: 'OpenSans',
            ),
            home: WeatherOverviewScreen(),
            routes: {
              // WeatherDetailScreen.routeName: (ctx) => WeatherDetailScreen()
            }));
  }
}
