import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scan_me/component/MyButton.dart';
import 'package:scan_me/pages/qr_scanner.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart'; // Uncomment if you want to open URLs

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
    // LAN https://backend-scanme.onrender.com/ --> Local
    // https://99aefeeed4a6.ngrok-free.app/components/${widget.componentId}
    final url = Uri.parse(
      'https://b3e15afded98.ngrok-free.app/components/${widget.componentId}',
    );
    try {
      final response = await http.get(url).timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        setState(() {
          componentData = json.decode(response.body);
          isLoading = false;
        });
      } else {
        setState(() => isLoading = false);
        _showSnackBar('❌ Failed to fetch component data.');
      }
    } on TimeoutException {
      _showSnackBar('⏱ Request timed out.');
      setState(() => isLoading = false);
    } catch (e) {
      _showSnackBar('🔥 Error: $e');
      setState(() => isLoading = false);
      print("errrorrrrr: $e");
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Component Id :',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              widget.componentId,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => QRScannerScreen()),
            );
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : componentData == null
          ? const Center(child: Text('Component not found.'))
          : Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDetail('🏢 Society Name', componentData!['Society_Name']),
                      const SizedBox(height: 12),
                      _buildDetail(
                        '🏬 Number of Floors',
                        componentData!['Number_of_Floors'],
                      ),
                      const SizedBox(height: 12),
                      _buildDetail(
                        '⚙️ Technical Room Number',
                        componentData!['Technical_Room_Number'].toString(),
                      ),
                      const SizedBox(height: 12),
                      _buildDetail(
                        '🗄️ Cabinet Number',
                        componentData!['Cabinet_Number'],
                      ),
                      const SizedBox(height: 12),
                      _buildDetail('🔀 Switcher', componentData!['Switcher']),
                      const SizedBox(height: 12),
                      _buildDetail('🔌 Port', componentData!['Port']),
                      const SizedBox(height: 20),
                      _buildDetail('📊 State Port', componentData!['State_Port'].toString()),
                      const SizedBox(
                        width: double.infinity,
                        height: 20),
                        Mybutton(
                          Data: 'Update Infromation',
                          onPressed: (){},
                        )
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildDetail(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
