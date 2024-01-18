/*
  * Library imports
 */
import 'package:flutter/material.dart';
import 'package:app/utils/global.variables.dart';

class DataTemplate extends StatelessWidget {
  const DataTemplate({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.bgColor,
      appBar: AppBar(
        title: const Text(
          "Greenhouse Software",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        backgroundColor: GlobalVariables.navColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Text(
                title,
                style: const TextStyle(fontSize: 25, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
