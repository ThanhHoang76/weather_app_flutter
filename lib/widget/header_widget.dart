import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import '../controller/global_controller.dart';
import 'package:get/get.dart';



class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "";
  //format và lấy ngày giừo hiện tại của hệ thống
  String datetime = DateFormat("yMMMMd").format(DateTime.now());
  final GlobalController globalController =
  Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    // TODO: implement initState
    getAddress(globalController.getLattitude().value, globalController.getLongtitude().value);
    super.initState();
  }

  //láy vị trí hiện tại
  getAddress(lat, long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    print(placemarks);
    Placemark place = placemarks[0];
    setState(() {
      city = place.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            alignment: Alignment.topLeft,
            child: Text(
                city,
                style: const TextStyle(
                  fontSize: 30
                ),
            ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          alignment: Alignment.topLeft,
          child: Text(
            datetime,
            style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                height: 1.5
            ),
          ),
        )
      ],
    );
  }
}
