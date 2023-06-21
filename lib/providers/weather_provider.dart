import 'package:flutter/material.dart';

import '../models/weather.dart';
import '../services/weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  final _service = WeatherService();
  bool isLoading = false;
  List<Weather> _items = [];
  Weather daily = Weather(date: '', icon: '', title: '', avgtemp_c: 0, maxtemp_c: 0); // Initialize with default value

  List<Weather> get items => _items;

  Weather get dailyData => daily;

  Future<void> getAllItems() async {
    final response = await _service.getAll();
    _items = response;
  }

  Future<void> getDaily() async {
    final response = await _service.getDaily();
    print(response);
    daily = response as Weather;
  }
}
