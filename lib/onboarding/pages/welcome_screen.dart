import 'package:flutter/material.dart';
import 'package:preview/onboarding/widgets/view.dart';
import 'package:provider/provider.dart';
import '../providers/level_provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  final List<Map<String, String>> buttons = const [
    {'label': 'Beginner', 'icon': 'beginner'},
    {'label': 'Intermediate', 'icon': 'intermediate'},
    {'label': 'Upper Intermediate', 'icon': 'upper-intermediate'},
    {'label': 'Advanced', 'icon': 'advanced'},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final circleDiameter = screenWidth * 1.5;
    final levelProvider = Provider.of<LevelProvider>(context);
    final activeIndex = levelProvider.selectedLevelIndex;

    final TextStyle largeTitle = Theme.of(context).textTheme.bodyLarge!;

    return Stack(
      children: [
        Positioned.fill(child: Container(color: Theme.of(context).scaffoldBackgroundColor)),
        Positioned(
          top: screenHeight * 0.1,
          left: 0,
          width: screenWidth,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 75),
            child: Image.asset('assets/icons/welcome.png'),
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
            padding: const EdgeInsets.only(top: 65),
            child: SizedBox(
              width: screenWidth * 0.9,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('What is your\nEnglish level?', style: largeTitle, textAlign: TextAlign.center),
                  const SizedBox(height: 20),
                  Column(
                    children: List.generate(buttons.length, (index) {
                      final btn = buttons[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: LevelButton(
                          label: btn['label']!,
                          iconPath: btn['icon']!,
                          isActive: activeIndex == index,
                          onTap: () => levelProvider.setLevel(index),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
