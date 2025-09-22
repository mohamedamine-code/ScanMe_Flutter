import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final String Data;
  final VoidCallback onPressed;
  const Mybutton({super.key, required this.Data, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: const Icon(Icons.open_in_new, color: Colors.white),
        label: Text(
          Data,
          style: TextStyle(fontSize: 17, color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.indigo,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
