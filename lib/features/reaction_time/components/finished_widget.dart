import 'package:flutter/material.dart';
import 'package:reaction_time_app/core/routes/app_icons.dart';

class FinishedWidget extends StatelessWidget {
  final String message;
  final Function() onTap;

  const FinishedWidget({
    required this.message,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.blue),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20,),
            Icon(
              AppIcons.restartIcon,
              color: Colors.white,
              size: 50,
            ),
            const SizedBox(height: 30,),
            const Text(
              'TOQUE PARA REINICIAR',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
