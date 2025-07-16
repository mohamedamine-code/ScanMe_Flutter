import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
      'https://af3a1c702acc.ngrok-free.app/components/${widget.componentId}',
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
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to fetch component data.')),
        );
      }
    } on TimeoutException catch (_) {
      print('⏱ Request timed out');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Request timed out.')));
      setState(() => isLoading = false);
    } catch (e) {
      print('🔥 HTTP error: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Component: ${widget.componentId}')),
      body: isLoading
          ? const Center(child: Text('not founde'))
          : componentData == null
          ? const Center(child: Text('Component not found.'))
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Text(
                    'Name: ${componentData!['name']}',
                    style: const TextStyle(fontSize: 20),
                  ),
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
