import 'package:flutter/material.dart';

class TimeTextWidget extends StatelessWidget {
  final String message;
  final Color backgroundColor;
  final Function () onTap;

  const TimeTextWidget({
    required this.message,
    required this.backgroundColor,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(color: backgroundColor),
        child: Center(
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
