// SmartInventory Flutter App - Main Code Structure
// This example uses: mobile_scanner for QR, http for API

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SmartInventory')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Scan QR Code'),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const QRScannerScreen()),
          ),
        ),
      ),
    );
  }
}



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


class ComponentDetailScreen extends StatefulWidget {
  final String componentId;
  const ComponentDetailScreen({super.key, required this.componentId});

  @override
  State<ComponentDetailScreen> createState() => _ComponentDetailScreenState();
}

class _ComponentDetailScreenState extends State<ComponentDetailScreen> {
  Map<String, dynamic>? componentData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchComponentData();
  }

  Future<void> _fetchComponentData() async {
    final url = Uri.parse('https://192.168.1.12:5000/components/${widget.componentId}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        componentData = json.decode(response.body);
        isLoading = false;
      });
    } else {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to fetch component data.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Component: ${widget.componentId}')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : componentData == null
              ? const Center(child: Text('Component not found.'))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      Text('Name: ${componentData!['name']}', style: const TextStyle(fontSize: 20)),
                      const SizedBox(height: 10),
                      Text('Type: ${componentData!['type']}'),
                      Text('Quantity: ${componentData!['quantity']}'),
                      Text('Location: ${componentData!['location']}'),
                      const SizedBox(height: 10),
                      if (componentData!['datasheet_url'] != null)
                        ElevatedButton(
                          onPressed: () {
                            // Launch datasheet URL (needs url_launcher)
                          },
                          child: const Text('Open Datasheet'),
                        ),
                    ],
                  ),
                ),
    );
  }
}
