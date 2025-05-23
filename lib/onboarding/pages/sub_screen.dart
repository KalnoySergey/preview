import 'dart:io';

import 'package:flutter/material.dart';
import 'package:preview/onboarding/widgets/view.dart';

class SubScreen extends StatelessWidget {
  const SubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final circleDiameter = screenWidth * 1.5;

    final TextStyle largeTitle = Theme.of(context).textTheme.bodyLarge!;
    final TextStyle smallTitle = Theme.of(context).textTheme.bodySmall!;
    final TextStyle mediumTitle = Theme.of(context).textTheme.bodyMedium!;
    final TextStyle btn = Theme.of(context).textTheme.labelLarge!;

    final url =
        Platform.isAndroid
            ? 'https://play.google.com/store/apps/details?id=tv.englishclub.b2c'
            : 'https://apps.apple.com/us/app/english-club-tv/id1243419092';

    return Stack(
      children: [
        Positioned.fill(child: Container(color: Theme.of(context).scaffoldBackgroundColor)),
        Positioned(
          top: screenHeight * 0.05,
          left: 0,
          width: screenWidth,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 110),
            child: Image.asset('assets/icons/sub.png'),
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
            padding: EdgeInsets.only(top: circleDiameter / 8),
            child: SizedBox(
              width: screenWidth * 0.9,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('More options with\na subscription', style: largeTitle, textAlign: TextAlign.center),
                  const SizedBox(height: 30),
                  Text(
                    'More than 1000 video lessons, access to live,\nbroadcasts, offline mode, choice of video quality\nbookmarks, participation in competitions and\nmuch more,',
                    style: smallTitle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text('from \$1.17/month', style: mediumTitle, textAlign: TextAlign.center),
                  const SizedBox(height: 30),
                  SubBtn(url: url, style: btn),
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
