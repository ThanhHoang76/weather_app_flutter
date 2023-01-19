import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_flutter/screens/home_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnimatedSplashScreen(
        splash: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Lottie.asset(
                "assets/icons/28136-weather-icon-cloudy.json",
                // fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                height: 150,
                width: 200,
              ),
            ),
            //SizedBox(height: 77),
            const Text(
              "Weather",
              style: TextStyle(
                fontSize: 30,
                color: Colors.black54,
                fontFamily: 'Comfortaa',
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "product by Thành Hoàng",
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                  fontFamily: 'Comfortaa',
                  fontStyle: FontStyle.italic
              ),
            ),
          ],
        ),
        nextScreen: const HomeScreen(),
        splashIconSize: 180,
        duration: 3000,
        splashTransition: SplashTransition.scaleTransition,
        animationDuration: const Duration(seconds: 1),
      ),
    );
  }
}
