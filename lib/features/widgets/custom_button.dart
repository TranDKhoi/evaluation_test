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
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30,
        width: MediaQuery.of(context).size.width / 3.4,
        decoration: BoxDecoration(color: Color(color)),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 12.5),
          ),
        ),
      ),
    );
  }
}
