import 'package:flutter/material.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final circleDiameter = screenWidth * 1.5;

    final TextStyle largeTitle = Theme.of(context).textTheme.bodyLarge!;
    final TextStyle smallTitle = Theme.of(context).textTheme.bodySmall!;

    return Stack(
      children: [
        Positioned.fill(child: Container(color: Theme.of(context).scaffoldBackgroundColor)),
        Positioned(
          top: screenHeight * 0.05,
          left: 0,
          width: screenWidth,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 120),
            child: Image.asset('assets/icons/update.png'),
          ),
        ),
        Positioned(
          top: screenHeight / 2.4,
          left: screenWidth / 2 - circleDiameter / 2,
          width: circleDiameter,
          height: circleDiameter,
          child: Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(circleDiameter / 2)),
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: circleDiameter / 4),
            child: SizedBox(
              width: screenWidth * 0.9,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Regularly updated\nvideo content', style: largeTitle, textAlign: TextAlign.center),
                  const SizedBox(height: 20),
                  Text('5 new episodes are included\nevery week', style: smallTitle, textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: screenHeight / 2.95,
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
