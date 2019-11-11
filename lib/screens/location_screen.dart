import 'package:flutter/material.dart';
import 'package:clima_flutter/utilities/constants.dart';
import 'package:clima_flutter/services/weather.dart';
import 'package:clima_flutter/screens/city_screen.dart';
import 'package:clima_flutter/services/fiveDayForcast.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather; // JSON data

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = new WeatherModel();
  int temperature;
  String weatherIcon;
  String cityName;
  String weatherMessage;
  FiveDayForecast fiveDayForecast = FiveDayForecast();
  List<FiveDayForecast> fiveDayForecastList = [
    FiveDayForecast(day: 'temp1', icon: 'temp1', tempH: 2, tempL: 2),
    FiveDayForecast(day: 'temp2', icon: 'temp2', tempH: 2, tempL: 2),
    FiveDayForecast(day: 'temp3', icon: 'temp3', tempH: 3, tempL: 3),
    FiveDayForecast(day: 'temp4', icon: 'temp4', tempH: 4, tempL: 4),
    FiveDayForecast(day: 'temp5', icon: 'temp5', tempH: 5, tempL: 5)
  ];

  @override
  void initState() {
    super.initState();

    // widget refers to main widget in widget tree: LocationScreen stateful widget
    updateUI(widget.locationWeather);
  }

  // weatherData is the JSON data.
  void updateUI(dynamic weatherData) {
    // so Widget can reflect the property changes updates
    setState(() {
      // to prevent app from crashing when location can't be fetched
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get weather data';
        cityName = '';
        return; // exit updateUI function
        // return can be used even in void function -> ends function instead continuing to end
      }

      temperature = weatherData['main']['temp']
          .toInt(); // converting temperature we get to int.
      weatherMessage = weatherModel.getMessage(temperature);
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weatherModel.getWeatherIcon(condition);

      cityName = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      // getLocationW returns a Future
                      // use await to make sure weatherData is not Null
                      var weatherData = await weatherModel.getLocationWeather();
                      updateUI(weatherData);
                      var weatherForecastData =
                          weatherModel.getFiveDayWeather(null);
                      fiveDayForecast.updateFiveDayForecast(
                          weatherForecastData, fiveDayForecastList);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 40.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      // typedName is output of Navigator.push method (what we receive from other screen)
                      var typedName = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                      if (typedName != null) {
                        print(typedName);
                        var weatherData =
                            await weatherModel.getCityWeather(typedName);
                        print('weatherData fetched: $weatherData');
                        var weatherForecastData =
                            weatherModel.getFiveDayWeather(typedName);
                        print(
                            'weatherForecastData fetched: $weatherForecastData');
                        updateUI(weatherData);
                        fiveDayForecast.updateFiveDayForecast(
                            weatherForecastData, fiveDayForecastList);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 40.0,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '$temperature°',
                        style: kTempTextStyle,
                      ),
                      Text(
                        weatherIcon,
                        style: kConditionTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Text(
                    '$weatherMessage in $cityName!',
                    textAlign: TextAlign.right,
                    style: kMessageTextStyle,
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              'temp',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('temp'),
                            Text('temp'),
                            Text('temp'),
                          ]),
                      SizedBox(
                          height: 150.0,
                          child: VerticalDivider(color: Colors.teal.shade100)),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text('temp',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('temp'),
                            Text('temp'),
                            Text('temp'),
                          ]),
                      SizedBox(
                          height: 150.0,
                          child: VerticalDivider(color: Colors.teal.shade100)),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text('temp',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('temp'),
                            Text('temp'),
                            Text('temp'),
                          ]),
                      SizedBox(
                          height: 150.0,
                          child: VerticalDivider(color: Colors.teal.shade100)),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text('temp',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('temp'),
                            Text('temp'),
                            Text('temp'),
                          ]),
                      SizedBox(
                          height: 150.0,
                          child: VerticalDivider(color: Colors.teal.shade100)),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text('temp',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('temp'),
                            Text('temp'),
                            Text('temp'),
                          ]),
                    ]),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
