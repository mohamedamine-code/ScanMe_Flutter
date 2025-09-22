// SmartInventory Flutter App - Main Code Structure
// This example uses: mobile_scanner for QR, http for API

import 'package:flutter/material.dart';
import 'package:scan_me/pages/HomePage.dart';
import 'package:scan_me/theme/const_theme.dart';

void main() => runApp(const SmartInventoryApp());

class SmartInventoryApp extends StatelessWidget {
  const SmartInventoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartInventory',
      theme: lightTheme,
      home: const HomeScreen(),
    );
  }
}


