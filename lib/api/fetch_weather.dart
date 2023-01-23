import 'dart:convert';
import 'package:weather_app_flutter/model/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_flutter/model/weather_data_current.dart';
import 'package:weather_app_flutter/model/weather_data_daily.dart';
import 'package:weather_app_flutter/model/weather_data_hourly.dart';
import 'package:get/get.dart';
import 'package:weather_app_flutter/screens/no_data.dart';
import '../ultis/api_url.dart';

class FetchWeatherApi {
  WeatherData? weatherData;

  /// Lấy kinh độ và vĩ độ của người dùng sau đó thực hiện call api
  /// API sử dụng kinh độ và vĩ độ,decode Json Response
  /// và trả về weatherdata
  ///
  /// Args:
  ///   lat: kinh độ
  ///   lon: vĩ độ
  ///
  /// Returns:
  ///   WeatherData object
  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiUrl(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(
      WeatherDataCurrent.fromJson(jsonString),
      WeatherDataHourly.fromJson(jsonString),
      WeatherDataDaily.fromJson(jsonString),
    );
    if(response.statusCode == 404){
      Get.to(NoDataScreen());
    }
    return weatherData!;

  }
}
