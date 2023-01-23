import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_flutter/screens/home_screen.dart';
import 'package:weather_app_flutter/controller/global_controller.dart';

class NoDataScreen extends StatelessWidget {
  NoDataScreen({Key? key}) : super(key: key);
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 120),
            Image.asset(
              "assets/images/404-lost-in-space.png",
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: const [
                  Text(
                    "Đã xảy ra lỗi",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Comfortaa",
                    ),
                  ),
                  Text(
                    "Vui lòng thử lại sau!",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Comfortaa",
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 85),
            GestureDetector(
              onTap: () {
                Get.to(const HomeScreen());
              },
              child: Container(
                alignment: Alignment.center,
                width: 140,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  color: const Color(0xFF2E8994),
                ),
                child: const Text(
                  "Quay lại",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
