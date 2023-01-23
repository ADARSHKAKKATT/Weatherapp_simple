import 'package:flutter/material.dart';
import 'package:weatherapp_simple/weather_api_dataclass.dart';
import 'package:weatherapp_simple/weather_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Weather(),
    );
  }
}

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  WhetherData service = WhetherData();
  Whether w = new Whether();

  String c_whether = '';
  double temp = 0;
  double farh = 0;
  @override
  void initState() {
    super.initState();
    getWhether();
  }

  void getWhether() async {
    w = await service.getWhetherData('Kerala');
    print(w.temperature_c);
    print(w.temperature_f);
    print(w.condition);


    setState(() {
      c_whether = w.condition;
      temp = w.temperature_c;
      farh = w.temperature_f;

    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/weather2.jpg"), fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Text(
                      "Kerala",
                      style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontFamily: 'KaushanScript'),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Friday, ",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 40),
                    ),
                    Text(
                      "June ",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    Text(
                      '21',
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Container(
                        child: Column(
                          children: [
                            Icon(
                              Icons.cloud,
                              size: 100,
                              color: Colors.white,
                            ),
                            Text(
                              "${w.condition}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.thermostat,
                          size: 70,
                          color: Colors.white,
                        ),
                        Text(
                          temp.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'JotiOne'),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.thermostat,
                          size: 70,
                          color: Colors.white,
                        ),
                        Text(
                          farh.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'JotiOne'),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Text(
                      temp.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 80,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      "ºC",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 80,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
