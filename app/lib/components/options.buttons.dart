/*
  * Library imports
 */
import 'package:flutter/material.dart';

class OptionsButtons extends StatelessWidget {
  const OptionsButtons(
      {super.key,
      required this.pressed,
      required this.title,
      required this.color});

  final void Function() pressed;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 30,
      child: OutlinedButton(
        onPressed: () => pressed(),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          side: MaterialStateProperty.all(
            BorderSide(color: color),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(color: color),
        ),
      ),
    );
  }
}
