import 'package:flutter/material.dart';

class LiveScreen extends StatelessWidget {
  const LiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final circleDiameter = screenWidth * 1.4;

    final TextStyle largeTitle = Theme.of(context).textTheme.bodyLarge!;
    final TextStyle smallTitle = Theme.of(context).textTheme.bodySmall!;

    return Stack(
      children: [
        Positioned.fill(child: Container(color: Theme.of(context).scaffoldBackgroundColor)),
        Positioned(
          top: screenHeight / 5,
          left: screenWidth / 2 - circleDiameter / 2,
          width: circleDiameter,
          height: circleDiameter,
          child: Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(circleDiameter / 2)),
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(top: 70, left: 32, right: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/icons/live.png', width: screenWidth / 1.5),
                const SizedBox(height: 50),
                Text('Live broadcasts', style: largeTitle, textAlign: TextAlign.center),
                const SizedBox(height: 20),
                Text('English Club TV & \n English Club TV for Kids', style: smallTitle, textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
        Positioned(
          top: screenHeight * 0.12,
          left: 0,
          width: screenWidth,
          height: 120,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 75),
            child: Image.asset('assets/icons/logo.png'),
          ),
        ),
      ],
    );
  }
}
