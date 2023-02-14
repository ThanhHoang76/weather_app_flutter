import 'package:flutter/material.dart';
import 'package:weather_app_flutter/model/weather_data_current.dart';
import '../ultis/custom_colors.dart';
import 'details_icon_widget.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const CurrentWeatherWidget({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //nhiệt độ
        temperatureAreaWidget(),
        const SizedBox(height: 20),
        //thông tin chi tiết, tốc độ gió, đổ ẩm,  mây
        currenWeatherMoreDetailsWidget(),
      ],
    );
  }

  Widget temperatureAreaWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //icon thời tiết
        Image.asset(
          "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
          height: 80,
          width: 80,
        ),
        Container(
          height: 80,
          width: 2,
          color: Colors.black54.withAlpha(15),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "${weatherDataCurrent.current.temp!.toInt()}°C",
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 68,
                    color: CustomColors.textColorBlack),
              ),
              TextSpan(
                text: "${weatherDataCurrent.current.weather![0].description}",
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.grey),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget currenWeatherMoreDetailsWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DetailsIcon(imageAsset: "assets/icons/windspeed.png"),
            DetailsIcon(imageAsset: "assets/icons/clouds.png"),
            DetailsIcon(imageAsset: "assets/icons/humidity.png")
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${weatherDataCurrent.current.windSpeed}Km/h",
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${weatherDataCurrent.current.clouds}%",
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${weatherDataCurrent.current.humidity}%",
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            )
          ],
        )
      ],
    );
  }
}
