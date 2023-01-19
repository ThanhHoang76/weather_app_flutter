import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_flutter/ultis/custom_colors.dart';

class HourlyDetails extends StatelessWidget {
  int temp;
  int index;
  int cardIndex;
  int timeStamp;
  String weatherIcon;

  /// It takes a timestamp and returns a string of the time in the format of "1:00
  /// PM"
  ///
  /// Args:
  ///   timeStamp: The timeStamp is the time in milliseconds since epoch.
  ///
  /// Returns:
  ///   The time in the format of "jm"
  String getTime(final timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp);
    String timeFormat = DateFormat.jm().format(time);
    return timeFormat;
  }

  HourlyDetails(
      {Key? key,
      required this.temp,
      required this.index,
      required this.cardIndex,
      required this.timeStamp,
      required this.weatherIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 18),
          /// format time
          /// set text là máu trắng nếu cardIndex== index(container đang chọn)
          child: Text(
            getTime(timeStamp),
            style: TextStyle(
                color: cardIndex == index
                    ? Colors.white
                    : CustomColors.textColorBlack),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: Image.asset(
            "assets/weather/$weatherIcon.png",
            height: 40,
            width: 40,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 1),
          child: Text("$temp°C"),
        ),
      ],
    );
  }
}
