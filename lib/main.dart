import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'onboarding/navigator.dart';
import 'onboarding/providers/level_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(
    MultiProvider(providers: [ChangeNotifierProvider(create: (_) => LevelProvider())], child: const OnboardingApp()),
  );
}

class OnboardingApp extends StatelessWidget {
  const OnboardingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'English Club TV',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFCF142B),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFCF142B), brightness: Brightness.light),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 36, fontWeight: FontWeight.w600, height: 1.1),
          bodyMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, height: 1.1),
          bodySmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, height: 1.1),
          labelLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFCF142B), foregroundColor: Colors.white),
        useMaterial3: true,
      ),
      home: const OnboardingNavigator(),
    );
  }
}
