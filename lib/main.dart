// SmartInventory Flutter App - Main Code Structure
// This example uses: mobile_scanner for QR, http for API

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:http/http.dart' as http ;
import 'dart:convert';

import 'package:scan_me/pages/HomePage.dart';

void main() => runApp(const SmartInventoryApp());

class SmartInventoryApp extends StatelessWidget {
  const SmartInventoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartInventory',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const HomeScreen(),
    );
  }
}
