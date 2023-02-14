import 'package:flutter/material.dart';
import 'package:weather_app_flutter/model/weather_data_current.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weather_app_flutter/ultis/custom_colors.dart';

class ComfortLevel extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const ComfortLevel({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(top: 1, left: 20, right: 20, bottom: 20),
          child: const Text(
            "Comfort Level",
            style: TextStyle(fontSize: 18),
          ),
        ),
        SizedBox(
          height: 140,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: weatherDataCurrent.current.humidity!.toDouble(),
                  appearance: CircularSliderAppearance(
                      customWidths: CustomSliderWidths(
                          handlerSize: 0, trackWidth: 12, progressBarWidth: 15),
                      infoProperties: InfoProperties(
                        bottomLabelText: "Độ ẩm",
                        bottomLabelStyle: const TextStyle(
                          letterSpacing: 0.1,
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                      animationEnabled: true,
                      size: 140,
                      customColors: CustomSliderColors(
                          hideShadow: true,
                          trackColor:
                              CustomColors.firstGradientColor.withAlpha(50),
                          progressBarColors: [
                            CustomColors.firstGradientColor,
                            CustomColors.secondGradientColor
                          ])),
                ),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(text:TextSpan(children: [
              const TextSpan(
                text: "feels like ",
                style: TextStyle(
                  fontSize: 12,
                  color: CustomColors.textColorBlack,
                  height: 0.8,
                ),
              ),
              TextSpan(
                text: "${weatherDataCurrent.current.feelsLike}",
                style: const TextStyle(
                  fontSize: 12,
                  color: CustomColors.textColorBlack,
                  height: 0.8,
                ),
              )
            ])),
            Container(
              height: 25,
              margin: const EdgeInsets.only(left: 40, right: 40),
              width: 1,
              color: Colors.grey,
            ),
            RichText(text:TextSpan(children: [
              const TextSpan(
                text: "Chỉ số tia UV ",
                style: TextStyle(
                  fontSize: 12,
                  color: CustomColors.textColorBlack,
                  height: 0.8,
                ),
              ),
              TextSpan(
                text: "${weatherDataCurrent.current.uvi}",
                style: const TextStyle(
                  fontSize: 12,
                  color: CustomColors.textColorBlack,
                  height: 0.8,
                ),
              )
            ],),),
          ],
        )
      ],
    );
  }
}
