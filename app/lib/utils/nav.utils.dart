/*
  * Libary imports
 */
import 'package:flutter/material.dart';
// ? https://pub.dev/packages/google_nav_bar
import 'package:google_nav_bar/google_nav_bar.dart';

/*
  * Page/Component imports
 */
import 'package:app/pages/home.dart';

class NavUtils {
  static int selectedIndex = 0;

  // Navigation Pages
  static const List<Widget> widgetOptions = <Widget>[
    HomePage(),
    Center(
      child: Text(
        'Some Data Page',
        style: TextStyle(color: Colors.black, fontSize: 25),
      ),
    ),
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
      icon: Icons.library_books_outlined,
      text: 'Some Data Page',
    ),
    GButton(
      icon: Icons.settings,
      text: 'Settings',
    ),
  ];

  // Other methods or code in the NavUtils class
}
