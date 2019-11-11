import 'package:flutter/material.dart';
import 'package:clima_flutter/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  // changing input text color to black as background is white
                  style: TextStyle(color: Colors.black),
                  decoration: kTextFieldInputDecoration,
                  // onChange passes input text from user as value to function below
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 13.0,
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(8.0, 9.0),
                      )
                    ]),
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context, cityName);
                  },
                  child: Text(
                    'Get Weather',
                    style: kButtonTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
