import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scan_me/component/MyButton.dart';
import 'package:scan_me/component/MyDrawer.dart';
import 'package:scan_me/component/CustomAppBarWithTheme.dart';
import 'package:scan_me/component/MyTextFlied.dart';

class Implimentation extends StatefulWidget {
  const Implimentation({super.key});

  @override
  State<Implimentation> createState() => _ImplimentationState();
}

class _ImplimentationState extends State<Implimentation> {
  // Cache controllers instead of creating new ones each build
  late final TextEditingController idController;
  late final TextEditingController societyNameController;
  late final TextEditingController numFloorsController;
  late final TextEditingController technicalRoomController;
  late final TextEditingController cabinetController;
  late final TextEditingController switcherController;
  late final TextEditingController portController;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Initialize controllers once in initState
    idController = TextEditingController();
    societyNameController = TextEditingController();
    numFloorsController = TextEditingController();
    technicalRoomController = TextEditingController();
    cabinetController = TextEditingController();
    switcherController = TextEditingController();
    portController = TextEditingController();
  }

  @override
  void dispose() {
    // Properly dispose all controllers
    idController.dispose();
    societyNameController.dispose();
    numFloorsController.dispose();
    technicalRoomController.dispose();
    cabinetController.dispose();
    switcherController.dispose();
    portController.dispose();
    super.dispose();
  }

  Future<void> _addElement() async {
    // Early return if fields are empty
    if (!_validateInputs()) {
      _showErrorSnackBar('Please fill in all fields');
      return;
    }

    setState(() => _isLoading = true);

    try {
      final url = "https://backend-scanme-1.onrender.com/components/insert-data";
      final uri = Uri.parse(url);

      final response = await http.post(
        uri,
        headers: const {'Content-Type': 'application/json'},
        body: jsonEncode({
          '_id': idController.text,
          'Society_Name': societyNameController.text,
          'Number_of_Floors': numFloorsController.text,
          'Technical_Room_Number': technicalRoomController.text,
          'Cabinet_Number': cabinetController.text,
          'Switcher': switcherController.text,
          'Port': portController.text,
          'State_Port': true
        }),
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (mounted) {
          _showSuccessSnackBar('✅ Added successfully');
          _clearAllFields();
        }
      } else {
        final errorMsg = utf8.decode(response.bodyBytes);
        if (mounted) {
          _showErrorSnackBar('Failed: $errorMsg');
        }
      }
    } on TimeoutException {
      if (mounted) {
        _showErrorSnackBar('Request timeout. Please try again.');
      }
    } catch (e) {
      if (mounted) {
        _showErrorSnackBar('Error: $e');
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  bool _validateInputs() {
    return idController.text.isNotEmpty &&
        societyNameController.text.isNotEmpty &&
        numFloorsController.text.isNotEmpty &&
        technicalRoomController.text.isNotEmpty &&
        cabinetController.text.isNotEmpty &&
        switcherController.text.isNotEmpty &&
        portController.text.isNotEmpty;
  }

  void _clearAllFields() {
    idController.clear();
    societyNameController.clear();
    numFloorsController.clear();
    technicalRoomController.clear();
    cabinetController.clear();
    switcherController.clear();
    portController.clear();
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green.shade600,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red.shade600,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Mydrawer(),
      appBar: const CustomAppBarWithTheme(
        title: 'Add Component',
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.asset(
            "assets/img/pexels-jplenio-1103970.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: _buildFormCard(),
          ),
        ),
      ],
    );
  }

  Widget _buildFormCard() {
    return Card(
      shadowColor: Colors.blueAccent,
      elevation: 10,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildFormFields(),
              const SizedBox(height: 30),
              _buildSubmitButton(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormFields() {
    return Column(
      children: [
        MyTextFlied(
          labelText: "_id",
          controller: idController,
        ),
        const SizedBox(height: 20),
        MyTextFlied(
          labelText: "Society Name",
          controller: societyNameController,
        ),
        const SizedBox(height: 20),
        MyTextFlied(
          labelText: "Number Floors",
          controller: numFloorsController,
        ),
        const SizedBox(height: 20),
        MyTextFlied(
          labelText: "Number Technical Room",
          controller: technicalRoomController,
        ),
        const SizedBox(height: 20),
        MyTextFlied(
          labelText: "Number Cabinet",
          controller: cabinetController,
        ),
        const SizedBox(height: 20),
        MyTextFlied(
          labelText: "Switcher",
          controller: switcherController,
        ),
        const SizedBox(height: 20),
        MyTextFlied(
          labelText: "Port",
          controller: portController,
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: _isLoading
          ? const SizedBox(
              height: 48,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Mybutton(
              Data: 'Submit',
              onPressed: _addElement,
            ),
    );
  }
}
