import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key,
      required this.onTap,
      required this.title,
      this.color = Colors.blue})
      : super(key: key);

  final VoidCallback onTap;
  final String title;
  var color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        primary: color,
      ),
      child: Text(title),
    );
  }
}
