import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app_flutter/model/weather_data.dart';

import '../api/fetch_weather.dart';

/// > The GlobalController is a GetxController that is accessible from anywhere in
/// the app
class GlobalController extends GetxController {
  //định vị thừa thiên huế
  final double lat = 16.461618965722867;
  final double lon = 107.59214795693468;


  /// Creating a reactive variable of type bool, double and double.
  final RxBool _isLoading = true.obs;
  final RxDouble _lattitude = 0.0.obs;
  final RxDouble _longtitude = 0.0.obs;
  final RxInt _currentIndex = 0.obs;

  /// biến gọi
  RxBool checkLoading() => _isLoading;
  RxDouble getLattitude() => _lattitude;
  RxDouble getLongtitude() => _longtitude;
  RxInt getIndex() => _currentIndex;
  final weatherData = WeatherData().obs;
  WeatherData getWeatherData() {
    return weatherData.value;
  }

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    }else {
      getIndex();
    }
    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    //không thể định vị
    if (!isServiceEnabled) {
      return Future.error("Định vị chưa được mở!");
    }

    //trạng thái cấp quyền định vị
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Bạn chưa cấp quyền định vị cho ứng dụng");
    } else if (locationPermission == LocationPermission.denied) {
      //yêu cầu cấp quyền
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Bạn chưa cấp quyền định vị cho ứng dụng");
      }
    }

    //lấy vị trí(kinh độ, vĩ độ) hiện tại của người dùng
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      //cập nhật vị trí hiện tại
      _lattitude.value = value.latitude;
      _longtitude.value = value.longitude;
      //call api
      return FetchWeatherApi()
          .processData(value.latitude, value.longitude)
          .then((value) {
        weatherData.value = value;
        _isLoading.value = false;
      });

    });
  }
}
