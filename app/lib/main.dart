/*
    * Library imports
  */
import 'package:flutter/material.dart';
import 'package:app/utils/global.variables.dart';
// ? https://pub.dev/packages/google_nav_bar
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:app/utils/nav.utils.dart';

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
            const ColorScheme.dark(primary: GlobalVariables.primaryColor),
      ),
      home: Scaffold(
        backgroundColor: GlobalVariables.bgColor,
        appBar: AppBar(
          backgroundColor: GlobalVariables.primaryColor,
          title: const Text(
            "Greenhouse Software",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        body: Center(
          child: NavUtils.widgetOptions.elementAt(NavUtils.selectedIndex),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Container(
              color: GlobalVariables.navColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[100]!,
                  gap: 8,
                  activeColor: Colors.black,
                  iconSize: 24,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: const Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.grey[100]!,
                  color: Colors.white,
                  tabs: NavUtils.tabs,
                  selectedIndex: NavUtils.selectedIndex,
                  onTabChange: (index) {
                    setState(() {
                      NavUtils.selectedIndex = index;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
