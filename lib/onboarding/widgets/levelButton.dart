import 'package:flutter/material.dart';

class LevelButton extends StatelessWidget {
  final String label;
  final String iconPath;
  final bool isActive;
  final VoidCallback onTap;

  const LevelButton({
    super.key,
    required this.label,
    required this.iconPath,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final activeColor = const Color(0xFF004990);
    final inactiveColor = Colors.white;
    final TextStyle btn = Theme.of(context).textTheme.labelLarge!;
    IconData icon = Icons.sentiment_dissatisfied_outlined;
    switch (iconPath) {
      case 'beginner':
        icon = Icons.sentiment_dissatisfied_outlined;
        break;
      case 'intermediate':
        icon = Icons.sentiment_satisfied_alt;
        break;
      case 'upper-intermediate':
        icon = Icons.sentiment_very_satisfied;
        break;
      case 'advanced':
        icon = Icons.sentiment_very_satisfied_outlined;
        break;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: isActive ? activeColor : inactiveColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: activeColor),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label, style: btn.copyWith(color: isActive ? Colors.white : activeColor)),
            SizedBox(width: 8),
            Icon(icon, color: isActive ? Colors.white : activeColor, size: 20),
          ],
        ),
      ),
    );
  }
}
