import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
    final url = Uri.parse(
      'https://backend-scanme.onrender.com/components/${widget.componentId}',
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
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Component Id :',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
            Text('${widget.componentId}',style: TextStyle(fontSize:17,fontWeight: FontWeight.bold,color:Colors.white),),
          ],
        ),
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=>QRScannerScreen()));
        }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : componentData == null
              ? const Center(child: Text('Component not found.'))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildDetail('📦 Name', componentData!['name']),
                          const SizedBox(height: 12),
                          _buildDetail('📂 Type', componentData!['type']),
                          const SizedBox(height: 12),
                          _buildDetail('🔢 Quantity', componentData!['quantity'].toString()),
                          const SizedBox(height: 12),
                          _buildDetail('📍 Location', componentData!['location']),
                          const SizedBox(height: 20),
                          if (componentData!['datasheet_url'] != null)
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                icon: const Icon(Icons.open_in_new,color:Colors.white),
                                label: const Text('Open Datasheet',style: TextStyle(fontSize: 17,color:Colors.white)),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.indigo,
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () async {
                                  final url = componentData!['datasheet_url'];
                                  
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  } else {
                                    _showSnackBar('Could not open the datasheet.');
                                  }
                                  _showSnackBar("Feature not implemented: $url");
                                },
                              ),
                            ),
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
        Text(label,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.grey,
            )),
        const SizedBox(height: 4),
        Text(value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            )),
      ],
    );
  }
}
