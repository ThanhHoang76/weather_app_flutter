import 'package:weather_app_flutter/model/weather_data_current.dart';
import 'package:weather_app_flutter/model/weather_data_daily.dart';
import 'package:weather_app_flutter/model/weather_data_hourly.dart';

/// `WeatherData` is a class that contains the current, hourly, and daily weather
/// data
class WeatherData{
  final WeatherDataCurrent? current;
  final WeatherDataHourly? hourly;
  final WeatherDataDaily? daily;
  WeatherData([this.current, this.hourly, this.daily]);
  WeatherDataCurrent getCurrentWeather()=>current!;
  WeatherDataHourly getHourlyWeather()=>hourly!;
  WeatherDataDaily getDailyWeather()=>daily!;
}