import 'package:clima_flutter/services/weather.dart';

class FiveDayForecast {
  String day;
  String icon;
  int tempH;
  int tempL;

  WeatherModel weatherModel = WeatherModel();

  FiveDayForecast({this.day, this.icon, this.tempH, this.tempL});

  void updateFiveDayForecast(
      dynamic weatherForecastData, List fiveDayForecastList) {
    var condition = weatherForecastData['list'][0]['weather'][0]['id'];
    fiveDayForecastList[0].icon = weatherModel.getWeatherIcon(condition);

    print('function entered');
    print(fiveDayForecastList[0].icon);
  }
}
