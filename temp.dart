import 'package:clima_flutter/services/fiveDayForcast.dart';

void main() {
  List<FiveDayForecast> fiveDayForecast = [
    FiveDayForecast(),
    FiveDayForecast(day: 'temp2', icon: 'temp2', tempH: 2, tempL: 2),
    FiveDayForecast(day: 'temp3', icon: 'temp3', tempH: 3, tempL: 3),
    FiveDayForecast(day: 'temp4', icon: 'temp4', tempH: 4, tempL: 4),
    FiveDayForecast(day: 'temp5', icon: 'temp5', tempH: 5, tempL: 5)
  ];

  print(fiveDayForecast[0].day);
}
