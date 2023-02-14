import 'package:flutter/cupertino.dart';
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
    //kiểm tra xem định vị đã được mở hay chưa, nếu chưa thì chạy lại getLocation ngược lại lấy index của forcecard
    if (_isLoading.isTrue) {
      getLocation();
    }else {
      getIndex();
    }
    super.onInit();
  }

  ///https://www.youtube.com/watch?v=9v44lAagZCI
  ///cách lấy lat và lon bằng lib geolocator
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
        .then((value) {//then((value) lấy giá trị của func getCurrentPosition rồi truyền vào var _lat và _lon
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
