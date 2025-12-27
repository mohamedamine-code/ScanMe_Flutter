import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:scan_me/theme/app_theme_context.dart';
import 'package:scan_me/pages/ComponetDetails.dart';
import 'package:scan_me/pages/HomePage.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  bool isScanning = true;
  MobileScannerController controller = MobileScannerController();
  String? scanErrorMessage;

  void _onBarcodeDetected(BarcodeCapture capture) {
    if (!isScanning) return;
    final List<Barcode> barcodes = capture.barcodes;

    if (barcodes.isNotEmpty) {
      final String? code = barcodes.first.rawValue;
      if (code != null && code.isNotEmpty) {
        // Haptic feedback on successful scan
        HapticFeedback.heavyImpact();
        
        setState(() => isScanning = false);
        
        // Navigate with smooth transition
        Future.delayed(const Duration(milliseconds: 200), () {
          if (mounted) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ComponentDetailScreen(componentId: code),
              ),
            );
          }
        });
      } else {
        _showErrorDialog('Invalid QR Code', 'The scanned QR code is empty or invalid.');
      }
    }
  }

  void _showErrorDialog(String title, String message) {
    HapticFeedback.vibrate();
    setState(() => isScanning = true); // Resume scanning
    
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.dispose();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: const Text(
            'Scan Component QR',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.flash_on, color: Colors.yellow),
              onPressed: () {
                HapticFeedback.lightImpact();
                controller.toggleTorch();
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade800,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.light_mode,
                        size: 18,
                        color: Colors.grey.shade600,
                      ),
                      Switch(
                        value: Theme.of(context).brightness == Brightness.dark,
                        onChanged: (_) {
                          AppThemeContext.toggleTheme();
                        },
                        activeColor: Colors.indigo,
                        inactiveThumbColor: Colors.orange,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      Icon(
                        Icons.dark_mode,
                        size: 18,
                        color: Colors.indigo,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
          leading: IconButton(
            onPressed: () {
              controller.dispose();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
              );
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white),
          ),
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                          strokeWidth: 2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Scanning...',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white70,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  /// Creates a custom scanner overlay with borders and corner markers.
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
        child: Stack(
          children: [
            const Center(
              child: Icon(
                Icons.qr_code_scanner,
                size: 48,
                color: Colors.white70,
              ),
            ),
            // Corner markers for better visibility
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.white, width: 3),
                    left: BorderSide(color: Colors.white, width: 3),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.white, width: 3),
                    right: BorderSide(color: Colors.white, width: 3),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.white, width: 3),
                    left: BorderSide(color: Colors.white, width: 3),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.white, width: 3),
                    right: BorderSide(color: Colors.white, width: 3),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
