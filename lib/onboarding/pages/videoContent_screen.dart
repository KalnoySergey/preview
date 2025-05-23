import 'package:flutter/material.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

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
                Image.asset('assets/icons/video.png', width: screenWidth / 1.5),
                const SizedBox(height: 30),
                Text('Over 1000 video\ntutorials', style: largeTitle, textAlign: TextAlign.center),
                const SizedBox(height: 20),
                Text('First 2 episodes of each\nprogram free', style: smallTitle, textAlign: TextAlign.center),
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
