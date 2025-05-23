import 'package:flutter/material.dart';

class SmoothIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;

  const SmoothIndicator({super.key, required this.count, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(count, (index) {
        final isActive = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 2,
          height: isActive ? 20 : 10,
          decoration: BoxDecoration(
            color:
                isActive
                    ? const Color(0xFF004990)
                    : currentIndex % 2 == 0
                    ? const Color(0xFFADADAD)
                    : const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(8),
          ),
        );
      }),
    );
  }
}
