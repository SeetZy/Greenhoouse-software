import 'dart:async';
import 'package:app/service/data.service.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/global.variables.dart';
import 'package:app/components/current.data.dart';
import 'package:app/components/charts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  late Timer _timer;
  int currentTemperature = 0;
  int currentHumidity = 0;
  String currentTime = "";

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(
      const Duration(seconds: 5),
      (Timer timer) {
        DataService.getData(
          (bool isLoading) {},
          (int temperature, int humidity, String time) {
            setState(() {
              currentTemperature = temperature;
              currentHumidity = humidity;
              currentTime = time;
            });
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget buildChartContainer(String title, Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: GlobalVariables.secondaryColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldMessengerKey,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Current Data
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CurrentData(
                          title: "Temperature:", data: "$currentTemperature°C"),
                      CurrentData(
                          title: "Soil Humidity:",
                          data: currentHumidity.toString()),
                    ],
                  ),
                ),

                // Data charts
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          "Data Charts:",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),

                      // Temp Chart
                      buildChartContainer(
                        'Temperature:',
                        ChartsView(
                          title: 'Temperature:',
                          dailyData: DataProvider.dailyTemp.reversed.toList(),
                          monthlyData:
                              DataProvider.monthlyTemp.reversed.toList(),
                        ),
                      ),

                      // Gap Between Charts
                      const SizedBox(
                        height: 50,
                      ),

                      // Hum Chart
                      buildChartContainer(
                        'Humidity:',
                        ChartsView(
                          title: 'Humidity:',
                          dailyData: DataProvider.dailyHum.reversed.toList(),
                          monthlyData:
                              DataProvider.monthlyHum.reversed.toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: // ...

                FloatingActionButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Last update: $currentTime"),
                    duration: const Duration(seconds: 3),
                  ),
                );
              },
              child: const Icon(
                Icons.info_outline_rounded,
                size: 45,
                color: Colors.white,
              ),
            ),

// ...
          ),
        ],
      ),
    );
  }
}
