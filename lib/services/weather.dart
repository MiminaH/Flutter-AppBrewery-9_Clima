import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart';

const apiKey = '2f83cb89bda0eeb6df4434f469222e98';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
const openWeatherMapFiveDayURL =
    'https://api.openweathermap.org/data/2.5/forecast';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location locationObject = Location();
    await locationObject.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${locationObject.latitude}&lon=${locationObject.longitude}&appid=$apiKey&units=metric');

    // JSON data we got from OpenWeatherMap
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  // my FiveDayWeather Data
  Future<dynamic> getFiveDayWeather(cityName) async {
    if (cityName == Null) {
      Location locationObject = Location();
      await locationObject.getCurrentLocation();

      NetworkHelper networkHelper = NetworkHelper(
          '$openWeatherMapFiveDayURL?lat=${locationObject.latitude}&lon=${locationObject.longitude}&appid=$apiKey&units=metric');
      return await networkHelper.getData();
    } else {
      NetworkHelper networkHelper = NetworkHelper(
          '$openWeatherMapFiveDayURL?q=$cityName&appid=$apiKey&units=metric');
      return await networkHelper.getData();
    }
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
