import 'dart:io';

import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:preview/onboarding/pages/view.dart';
import 'dart:ui';

import 'package:preview/onboarding/widgets/view.dart';
import 'package:url_launcher/url_launcher.dart';

class OnboardingNavigator extends StatefulWidget {
  const OnboardingNavigator({super.key});

  @override
  State<OnboardingNavigator> createState() => _OnboardingNavigatorState();
}

class _OnboardingNavigatorState extends State<OnboardingNavigator> {
  int currentIndex = 0;
  int previousIndex = 0;

  final screens = const [WelcomeScreen(), VideoScreen(), UpdateScreen(), LiveScreen(), SubScreen()];

  void next() async {
    if (currentIndex < screens.length - 1) {
      setState(() {
        previousIndex = currentIndex;
        currentIndex++;
      });
    } else {
      await _launchUrl();
    }
  }

  void previous() {
    if (currentIndex > 0) {
      setState(() {
        previousIndex = currentIndex;
        currentIndex--;
      });
    }
  }

  void onSwipe(DragEndDetails details) {
    if (details.primaryVelocity! < -50) {
      next();
    } else if (details.primaryVelocity! > 50) {
      previous();
    }
  }

  Future<void> _launchUrl() async {
    final url =
        Platform.isIOS
            ? 'https://apps.apple.com/us/app/english-club-tv/id1243419092'
            : 'https://play.google.com/store/apps/details?id=tv.englishclub.b2c';
    final Uri uri = Uri.parse(url);
    try {
      final bool launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!launched) {
        debugPrint('Could not launch $url');
      }
    } catch (e) {
      debugPrint('Error launching URL $url: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isForward = currentIndex >= previousIndex;

    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onHorizontalDragEnd: onSwipe,
            child: PageTransitionSwitcher(
              duration: const Duration(milliseconds: 300),
              reverse: !isForward,
              transitionBuilder: (child, animation, secondaryAnimation) {
                return Stack(
                  children: [
                    FadeTransition(
                      opacity: Tween<double>(begin: 0, end: 0.05).animate(animation),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(color: Colors.black),
                      ),
                    ),
                    FadeTransition(opacity: animation, child: child),
                  ],
                );
              },

              child: screens[currentIndex],
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 20,
                    width: 50,
                    decoration: BoxDecoration(color: const Color(0x33000000), borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      'Step ${currentIndex + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  SmoothIndicator(count: screens.length, currentIndex: currentIndex),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: currentIndex % 2 == 0 ? Color(0xFF004990) : Colors.white,
                    ),
                    onPressed: next,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
