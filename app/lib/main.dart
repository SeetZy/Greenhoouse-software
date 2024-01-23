/*
    * Library imports
  */
import 'package:app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/global.variables.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Sets the application to dark mode
        colorScheme:
            const ColorScheme.light(primary: GlobalVariables.primaryColor),
      ),
      home: Scaffold(
        backgroundColor: GlobalVariables.bgColor,
        appBar: AppBar(
          backgroundColor: GlobalVariables.navColor,
          title: const Text(
            "Greenhouse Software",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          elevation: 0,
        ),
        body: const HomePage(),
      ),
    );
  }
}
