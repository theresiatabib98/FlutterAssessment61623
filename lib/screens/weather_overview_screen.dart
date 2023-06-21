import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/weather_provider.dart';
import '../widgets/daily_weather.dart';
import '../widgets/upcoming_weather.dart';

class WeatherOverviewScreen extends StatefulWidget {
  @override
  _WeatherOverviewScreenState createState() => _WeatherOverviewScreenState();
}

class _WeatherOverviewScreenState extends State<WeatherOverviewScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // void initState() {
  //   super.initState();
  //
  // }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<WeatherProvider>(context, listen: false).getDaily();
    });

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<WeatherProvider>(context, listen: false).getAllItems();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleSwipeLeft() {
    if (_tabController.index < _tabController.length - 1) {
      _tabController.animateTo(_tabController.index + 1);
    }
  }

  void _handleSwipeRight() {
    if (_tabController.index > 0) {
      _tabController.animateTo(_tabController.index - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Daily'),
            Tab(text: 'Upcoming 2 weeks'),
          ],
        ),
      ),
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.velocity.pixelsPerSecond.dx > 0) {
            _handleSwipeRight();
          } else if (details.velocity.pixelsPerSecond.dx < 0) {
            _handleSwipeLeft();
          }
        },
        child: TabBarView(
          controller: _tabController,
          children: [
            DailyWeather(),
            UpcomingWeather(),
          ],
        ),
      ),
    );
  }
}
