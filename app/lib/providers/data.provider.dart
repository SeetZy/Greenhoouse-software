/*
  * Library imports
 */
// ? https://pub.dev/packages/provider
import 'package:provider/provider.dart';

class DataProvider {
  List<String> lastSetValues = [];
  List<String> averages = [];

  static List<DataLevels> allTime = [
    DataLevels('Jan', 35),
    DataLevels('Feb', 28),
    DataLevels('Mar', 34),
    DataLevels('Apr', 32),
    DataLevels('May', 65),
    DataLevels('Jun', 89),
    DataLevels('Jul', 21),
    DataLevels('Aug', 53),
    DataLevels('Sep', 10),
    DataLevels('Oct', 74),
    DataLevels('Nov', 27),
    DataLevels('Dec', 32),
  ];

  static List<DataLevels> montly = [
    DataLevels('0-5', 34),
    DataLevels('5-10', 28),
    DataLevels('10-15', 34),
    DataLevels('15-20', 32),
    DataLevels('20-25', 75),
    DataLevels('25-30', 85),
  ];
}

class DataLevels {
  DataLevels(this.timeSpace, this.data);

  final String timeSpace;
  final double data;
}
