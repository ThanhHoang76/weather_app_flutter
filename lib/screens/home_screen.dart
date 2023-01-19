import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_flutter/controller/global_controller.dart';
import 'package:weather_app_flutter/ultis/custom_colors.dart';
import 'package:weather_app_flutter/widget/comfort_level.dart';
import 'package:weather_app_flutter/widget/current_weather_widget.dart';
import 'package:weather_app_flutter/widget/daily_data_forecast.dart';
import 'package:weather_app_flutter/widget/header_widget.dart';
import 'package:weather_app_flutter/widget/hourly_data_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //permanent: true giữ trong bộ nhớ tạm
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
          body: Obx(() =>
              globalController.checkLoading().isTrue ? const Center(
                child: CircularProgressIndicator(),
              ) : Center(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    const SizedBox(height: 20),
                    const HeaderWidget(),
                    CurrentWeatherWidget(weatherDataCurrent: globalController.getWeatherData().getCurrentWeather()),
                    const SizedBox(height: 10),
                    HourlyDataWidget(weatherDataHourly: globalController.getWeatherData().getHourlyWeather()),
                    DailyDataForecast(weatherDataDaily: globalController.getWeatherData().getDailyWeather()),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ComfortLevel(weatherDataCurrent: globalController.getWeatherData().getCurrentWeather())
                  ],
                ),
              )),
      ),
    );
   }
}
