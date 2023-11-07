/*
  * Library imports
 */
import 'package:flutter/material.dart';
import 'package:app/utils/global.variables.dart';

class CurrentData extends StatefulWidget {
  const CurrentData({super.key, required this.title, required this.data});

  final String title;
  final String data;

  @override
  State<CurrentData> createState() => _CurrentDataState();
}

class _CurrentDataState extends State<CurrentData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: GlobalVariables.secondaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(fontSize: 25),
              ),
              Text(
                widget.data,
                style: const TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
