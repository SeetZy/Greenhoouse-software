// ignore_for_file: library_private_types_in_public_api

/*
  * Library imports
 */
import 'package:flutter/material.dart';
import 'package:app/utils/global.variables.dart';
// ? https://pub.dev/packages/syncfusion_flutter_charts
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:app/providers/data.provider.dart';

/*
  * Page/Component imports
 */
import 'package:app/components/options.buttons.dart';

class ChartsView extends StatefulWidget {
  const ChartsView({
    super.key,
    required this.title,
  });

  final String title;

  @override
  _ChartsViewState createState() => _ChartsViewState();
}

class _ChartsViewState extends State<ChartsView> {
  bool isAllTimeView = false;
  Color montlyColor = GlobalVariables.secondaryColor;
  Color allTimeColor = Colors.white;

  List<DataLevels> monthlyData = DataProvider.montly;
  List<DataLevels> allTimeData = DataProvider.allTime;

  @override
  Widget build(BuildContext context) {
    List<DataLevels> data = isAllTimeView ? allTimeData : monthlyData;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              OptionsButtons(
                pressed: () {
                  setState(() {
                    isAllTimeView = false;
                    montlyColor = GlobalVariables.secondaryColor;
                    allTimeColor = Colors.white;
                  });
                },
                color: montlyColor,
                title: 'Monthly',
              ),
              const SizedBox(width: 10),
              OptionsButtons(
                  pressed: () {
                    setState(() {
                      isAllTimeView = true;
                      montlyColor = Colors.white;
                      allTimeColor = GlobalVariables.secondaryColor;
                    });
                  },
                  color: allTimeColor,
                  title: 'All Time'),
            ],
          ),
        ),
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
