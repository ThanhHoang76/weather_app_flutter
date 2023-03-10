import '../api/api_key.dart';

/// It takes in two parameters, lat and lon, and returns a Json map
///
/// Args:
///   lat: latitude
///   lon: longitude
///
/// Returns:
///   Json map
String apiUrl(lat, lon) {
  String url;
  url = "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&exclude=minutely&appid=$apiKey&lang=vi&units=metric";
  return url;
}