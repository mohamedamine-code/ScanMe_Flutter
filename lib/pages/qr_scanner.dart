import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:scan_me/pages/ComponetDetails.dart';
import 'package:scan_me/pages/HomePage.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  bool isScanning = true;
  MobileScannerController controller= MobileScannerController();

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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('Scan Component QR',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.flash_on,color: Colors.yellow),
            onPressed: () {
              controller.toggleTorch();;
            },
          ),
        ],
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeScreen()));
        }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: controller,
            onDetect: _onBarcodeDetected,
          ),
          _buildOverlay(),
          if (isScanning)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Text(
                  'Scanning...',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  /// Creates a custom scanner overlay with borders.
  Widget _buildOverlay() {
    return Center(
      child: Container(
        width: 250,
        height: 250,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white70,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Center(
          child: Icon(
            Icons.qr_code_scanner,
            size: 48,
            color: Colors.white70,
          ),
        ),
      ),
    );
  }
}
