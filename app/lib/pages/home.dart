/*
  * Library imports
 */
import 'package:flutter/material.dart';
import 'package:app/utils/nav.utils.dart';
import 'package:app/utils/global.variables.dart';

/*
  * Page/Component imports
 */
import 'package:app/components/current.data.dart';
import 'package:app/components/charts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget buildCurrentData(String title, String data) {
    return CurrentData(title: title, data: data);
  }

  Widget buildChartContainer(String title, Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: GlobalVariables.secondaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Current Data
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildCurrentData('Current Hum:', '25'),
                buildCurrentData('Current Temp:', '25'),
              ],
            ),
          ),

          // Timelapse Video
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    "Timelapse:",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.height / 5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Charts
          Padding(
            padding:
                const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    "Data Charts:",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ),
                Column(
                  children: [
                    // Temp Chart
                    buildChartContainer(
                      'Temperature:',
                      ChartsView(
                        title: 'Temperature:',
                        pressed: () {
                          NavUtils.navigate(context, "Temperature:");
                        },
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
                        pressed: () {
                          NavUtils.navigate(context, "Humidity:");
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
