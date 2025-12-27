
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scan_me/pages/HomePage.dart';
import 'package:scan_me/theme/const_theme.dart';
import 'package:scan_me/services/theme_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hide status bar and navigation bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const SmartInventoryApp());
}

class SmartInventoryApp extends StatefulWidget {
  const SmartInventoryApp({super.key});

  @override
  State<SmartInventoryApp> createState() => _SmartInventoryAppState();
}

class _SmartInventoryAppState extends State<SmartInventoryApp> {
  late ThemeMode _themeMode;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final isDark = await ThemeService.getTheme();
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
      _isLoading = false;
    });
  }

  void _toggleTheme() async {
    final isDark = await ThemeService.toggleTheme();
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return MaterialApp(
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    return MaterialApp(
      title: 'Smart Inventory',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,
      home: HomeScreen(onThemeToggle: _toggleTheme),
    );
  }
}
