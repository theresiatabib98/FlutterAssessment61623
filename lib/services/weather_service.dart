import 'dart:convert';

import 'package:flutterassessment/models/weather.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  Future<List<Weather>> getAll() async {
    const url =
        'http://api.weatherapi.com/v1/forecast.json?key=c66156492d2842bfa3660049232106&q=34.02139053920694,35.647088393446026&days=14';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    print(response);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final forecast = json['forecast']['forecastday'];

      final weatherList = forecast.map<Weather>((day) {
        final date = day['date'];
        final astro = day['astro'];

        return Weather(
          date: date,
          moonrise: astro['moonrise'],
          moonset: astro['moonset'],
          sunrise: astro['sunrise'],
          sunset: astro['sunset'],
          icon: day['day']['condition']['icon'],
          title: day['day']['condition']['text'],
          maxtemp_c: day['day']['maxtemp_c'].toDouble(),
          avgtemp_c: day['day']['avgtemp_c'].toDouble(),
        );
      }).toList();

      print(weatherList);
      return weatherList;
    }
    return [];
    // throw "somthing went wrong";
  }

  Future<Object> getDaily() async {
    const url =
        'http://api.weatherapi.com/v1/current.json?key=c66156492d2842bfa3660049232106&q=34.02139053920694,35.647088393446026';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    print(response);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print('json');
      final current = json['current'];
      final location = json['location'];
      //
      // // final weatherList = forecast.map<Weather>((day) {
      //   final date = forecast['date'];
      //   final astro = forecast['astro'];
      //
      return Weather(
          date: location['localtime'],
          moonrise: '',
          moonset: '',
          sunrise: '',
          sunset: '',
          icon: current['condition']['icon'],
          title: current['condition']['text'],
          avgtemp_c: current['temp_c'].toDouble(),
          maxtemp_c: 0);
      // }).toList();

      // print(weatherList);
      // return weatherList;
    }
    return {};
    // throw "somthing went wrong";
  }
}
