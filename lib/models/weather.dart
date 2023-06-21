class Weather {
  final String date;
  String? moonrise;
  String? moonset;
  String? sunrise;
  String? sunset;
  final String icon;
  final String title;
  final double maxtemp_c;
  final double avgtemp_c;

  Weather(
      {required this.date,
      this.moonrise,
      this.sunrise,
      this.moonset,
      this.sunset,
      required this.icon,
      required this.title,
      required this.maxtemp_c,
      required this.avgtemp_c});
}

// class Weather {
//   final String date;
//   final String moonrise;
//   final String moonset;
//   final String sunrise;
//   final String sunset;
//   final String icon;
//   final String title;
//   final double maxtemp_c;
//   final double avgtemp_c;
//
//   Weather(this.date, this.moonrise, this.moonset, this.sunrise, this.sunset,
//       this.icon, this.title, this.maxtemp_c, this.avgtemp_c, {required moonrise, required date, required moonset});
// }
