/*
  * Libary imports
 */
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// ? https://pub.dev/packages/google_nav_bar
import 'package:google_nav_bar/google_nav_bar.dart';

/*
  * Page/Component imports
 */
import 'package:app/pages/home.dart';
import 'package:app/components/data.template.dart';

class NavUtils {
  static int selectedIndex = 0;

  // Navigation Pages
  static const List<Widget> widgetOptions = <Widget>[
    HomePage(),
    Center(
      child: Text(
        'Settings',
        style: TextStyle(color: Colors.black, fontSize: 25),
      ),
    ),
  ];

  // Navigation Buttons
  static const List<GButton> tabs = <GButton>[
    GButton(
      icon: Icons.home_rounded,
      text: 'Home',
    ),
    GButton(
      icon: Icons.settings,
      text: 'Settings',
    ),
  ];

  static void navigate(BuildContext context, title) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => DataTemplate(
          title: title,
        ),
      ),
    );
  }
}
