import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:scan_me/pages/ComponetDetails.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  bool isScanning = true;

  void _onBarcodeDetected(BarcodeCapture capture) {
    if (!isScanning) return;
    final List<Barcode> barcodes = capture.barcodes;

    if (barcodes.isNotEmpty) {
      final String? code = barcodes.first.rawValue;
      if (code != null) {
        setState(() => isScanning = false);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ComponentDetailScreen(componentId: code),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Component QR')),
      body: MobileScanner(
        onDetect: _onBarcodeDetected,
        // allowDuplicates: false,
      ),
    );
  }
}