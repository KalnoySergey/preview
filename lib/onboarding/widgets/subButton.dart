import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SubBtn extends StatelessWidget {
  final String url;
  final String text;
  final TextStyle? style;

  const SubBtn({super.key, required this.url, this.text = 'Subscribe', this.style});

  Future<void> _launchUrl() async {
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
    return InkWell(
      onTap: _launchUrl,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 44,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: const Color(0xFF003399), borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          text,
          style: style ?? const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
