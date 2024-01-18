// ignore_for_file: library_private_types_in_public_api

/*
  * Library imports
 */
import 'package:app/utils/nav.utils.dart';
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
    required this.pressed,
  });

  final String title;
  final VoidCallback pressed;

  @override
  _ChartsViewState createState() => _ChartsViewState();
}

class _ChartsViewState extends State<ChartsView> {
  bool monthlyView = false;
  Color dailyColor = GlobalVariables.primaryColor;
  Color monthlyColor = Colors.white;

  List<DataLevels> dailyData = DataProvider.daily;
  List<DataLevels> monthlyData = DataProvider.montly;

  @override
  Widget build(BuildContext context) {
    List<DataLevels> data = monthlyView ? monthlyData : dailyData;

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
                    monthlyView = false;
                    dailyColor = GlobalVariables.primaryColor;
                    monthlyColor = Colors.white;
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
                    dailyColor = Colors.white;
                    monthlyColor = GlobalVariables.primaryColor;
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

        // Button to see data more detailed
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.all(8.0),
          child: OptionsButtons(
            pressed: widget.pressed,
            title: 'See More',
            color: Colors.white,
            width: 110,
          ),
        )
      ],
    );
  }
}
