// ignore_for_file: library_private_types_in_public_api

/*
  * Library imports
 */
import 'package:flutter/material.dart';
import 'package:app/utils/global.variables.dart';
// ? https://pub.dev/packages/syncfusion_flutter_charts
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:app/service/data.service.dart';

/*
  * Page/Component imports
 */
import 'package:app/components/options.buttons.dart';

class ChartsView extends StatefulWidget {
  const ChartsView({
    super.key,
    required this.title,
    required this.dailyData,
    required this.monthlyData,
  });

  final String title;
  final List<DataLevels> dailyData;
  final List<DataLevels> monthlyData;

  @override
  _ChartsViewState createState() => _ChartsViewState();
}

class _ChartsViewState extends State<ChartsView> {
  bool monthlyView = false;
  Color dailyColor = GlobalVariables.navColor;
  Color monthlyColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    List<DataLevels> data = monthlyView ? widget.monthlyData : widget.dailyData;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              OptionsButtons(
                pressed: () {
                  setState(() {
                    monthlyView = false;
                    dailyColor = GlobalVariables.navColor;
                    monthlyColor = Colors.black;
                  });
                },
                color: dailyColor,
                title: 'Daily',
                width: 70,
              ),
              const SizedBox(width: 10),
              OptionsButtons(
                pressed: () {
                  setState(() {
                    monthlyView = true;
                    dailyColor = Colors.black;
                    monthlyColor = GlobalVariables.navColor;
                  });
                },
                color: monthlyColor,
                title: 'Monthly',
                width: 85,
              ),
            ],
          ),
        ),

        // Data chart
        SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          series: <ChartSeries<DataLevels, String>>[
            LineSeries<DataLevels, String>(
              dataSource: data,
              xValueMapper: (DataLevels stats, _) => stats.timeSpace,
              yValueMapper: (DataLevels stats, _) => stats.data,
              dataLabelSettings: const DataLabelSettings(isVisible: true),
            ),
          ],
        ),
      ],
    );
  }
}
