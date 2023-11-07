/*
  * Library imports
 */
import 'package:flutter/material.dart';
import 'package:app/utils/global.variables.dart';

/*
  * Page/Component imports
 */
import 'package:app/components/current.data.dart';
import 'package:app/components/charts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Current Data
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CurrentData(title: 'Current Hum:', data: '25'),
                    CurrentData(title: 'Current Temp:', data: '25'),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Charts
        Container(
          height: MediaQuery.of(context).size.height / 2.2,
          decoration: const BoxDecoration(
            color: GlobalVariables.primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    "Data Charts:",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                ChartsView(
                  title: 'Humidity:',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
