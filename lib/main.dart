import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:scan_me/pages/HomePage.dart';
import 'package:scan_me/theme/const_theme.dart';
import 'package:scan_me/services/theme_service.dart';
import 'package:scan_me/theme/app_theme_context.dart';

// Background isolate function for loading theme
Future<bool> _loadThemeInBackground() async {
  return await ThemeService.getTheme();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Enable true fullscreen mode
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  
  // Set preferred orientations (portrait only) - fire and forget, don't await
  unawaited(SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  ));

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
    // Start with light theme immediately to avoid loading screen
    _themeMode = ThemeMode.light;
    
    // Load theme in background and update when ready
    _loadThemeInBackground();
    
    // Set the global theme toggle callback
    AppThemeContext.setThemeToggleCallback(_toggleTheme);
  }

  Future<void> _loadThemeInBackground() async {
    // Load theme asynchronously without blocking
    final isDark = await ThemeService.getTheme();
    if (mounted) {
      setState(() {
        _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
        _isLoading = false;
      });
    }
  }

  void _toggleTheme() async {
    final isDark = await ThemeService.toggleTheme();
    if (mounted) {
      setState(() {
        _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Always show the app immediately with light theme as default
    // It will update to dark theme when loaded without showing loading screen
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Inventory',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,
      home: const HomeScreen(),
    );
  }
}
