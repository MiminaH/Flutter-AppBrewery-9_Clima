import 'package:flutter/material.dart';
import 'package:clima_flutter/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima_flutter/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
    print('Loading Screen initState() called.');
  }

  void getLocationData() async {
    // as we will use WeatherModel only once, could write it like this:
    // var weatherData = WeatherModel().getLocationWeather();
    WeatherModel weatherModel = WeatherModel();

    var weatherData = await weatherModel.getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100.0,
      ),
    ));
  }
}

/* Try-Catch Block
      try {
        Do something that might fail;
      }
      catch (e) {
        Catch an exceptions that occur;
      }
 */

/* Null Aware Operator
(we have a variable that might be null at some point)
(?? means if in future when we try to use this variable & it's equal
 to null use the Default Value instead)

      someVariable ?? defaultValue
 */
