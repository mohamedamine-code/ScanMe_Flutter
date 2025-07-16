import'package:flutter/material.dart';
import 'package:scan_me/pages/qr_scanner.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SmartInventory')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Scan yoo QR Code'),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const QRScannerScreen()),
          ),
        ),
      ),
    );
  }
}