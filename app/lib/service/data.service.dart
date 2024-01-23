/*
  * Utility imports
 */
import 'dart:convert';
import 'dart:developer';
import 'package:app/utils/http.routes.dart';
// ? https://pub.dev/packages/http
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class DataService {
  static Future<void> getData(
      Function(bool) setLoading, Function(int, int, String) updateData) async {
    try {
      setLoading(true);

      // HTTP GET request
      final response = await http.get(
        Uri.parse(HttpRoutes.getGreenhouseData),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);

        // Sort data based on timestamp in descending order
        jsonData.sort((a, b) {
          DateTime dateTimeA = DateFormat('dd/MM/yyyy HH:mm').parse(a['time']);
          DateTime dateTimeB = DateFormat('dd/MM/yyyy HH:mm').parse(b['time']);
          return dateTimeB.compareTo(dateTimeA);
        });

        // Retrieve the most recent temperature and humidity data
        if (jsonData.isNotEmpty) {
          int temperature = jsonData.first['tempC'];
          int humidity = jsonData.first['soilHum'];
          String time = jsonData.first['time'];

          // Process the most recent temperature and humidity data
          updateData(temperature, humidity, time);

          // Update the daily list with today's data
          String today = DateFormat('dd/MM/yyyy').format(DateTime.now());

          // Clear the existing daily and monthly lists
          DataProvider.dailyTemp.clear();
          DataProvider.dailyHum.clear();
          DataProvider.monthlyTemp.clear();
          DataProvider.monthlyHum.clear();

          Map<String, List<double>> dailyTempAverages = {};
          Map<String, List<double>> dailyHumAverages = {};

          // Calculate daily averages and add to the maps
          for (var dataEntry in jsonData) {
            DateTime entryDateTime =
                DateFormat('dd/MM/yyyy HH:mm').parse(dataEntry['time']);
            String entryDate = DateFormat('dd/MM/yyyy').format(entryDateTime);
            String entryTime = DateFormat('HH:mm').format(entryDateTime);

            // Add temperature and soil humidity data to daily averages maps
            dailyTempAverages.putIfAbsent(entryDate, () => []);
            dailyTempAverages[entryDate]?.add(dataEntry['tempC'].toDouble());

            dailyHumAverages.putIfAbsent(entryDate, () => []);
            dailyHumAverages[entryDate]?.add(dataEntry['soilHum'].toDouble());

            if (entryDate == today) {
              DataProvider.dailyTemp
                  .add(DataLevels(entryTime, dataEntry['tempC'].toDouble()));
              DataProvider.dailyHum
                  .add(DataLevels(entryTime, dataEntry['soilHum'].toDouble()));
            }
          }

          // Calculate monthly averages and add to monthly lists
          dailyTempAverages.forEach((date, tempValues) {
            List<double>? humValues = dailyHumAverages[date];

            double tempDailyAverage =
                tempValues.reduce((a, b) => a + b) / tempValues.length;
            double humDailyAverage =
                humValues!.reduce((a, b) => a + b) / humValues.length;

            // Add daily averages to the monthly lists
            DataProvider.monthlyTemp.add(DataLevels(date, tempDailyAverage));
            DataProvider.monthlyHum.add(DataLevels(date, humDailyAverage));
          });
        }
      } else {
        log('Request failed with status: ${response.statusCode}');
      }

      setLoading(false);
    } catch (error) {
      log('An error occurred whilst doing an HTTP request: $error');
    }
  }
}

class DataProvider {
  static List<DataLevels> dailyTemp = [];

  static List<DataLevels> dailyHum = [];

  static List<DataLevels> monthlyTemp = [];

  static List<DataLevels> monthlyHum = [];
}

class DataLevels {
  DataLevels(this.timeSpace, this.data);

  final String timeSpace;
  final double data;
}
