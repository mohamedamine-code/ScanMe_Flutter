
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scan_me/pages/HomePage.dart';
import 'package:scan_me/theme/const_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Hide status bar and navigation bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const SmartInventoryApp());
}

class SmartInventoryApp extends StatelessWidget {
  const SmartInventoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Inventory',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system, // Follow system theme
      home: const HomeScreen(),
    );
  }
}
