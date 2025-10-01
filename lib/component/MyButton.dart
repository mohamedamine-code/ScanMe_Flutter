import 'package:flutter/material.dart';

class Mybutton extends StatefulWidget {
  final String Data;
  final VoidCallback onPressed;
  const Mybutton({super.key, required this.Data, required this.onPressed});

  @override
  State<Mybutton> createState() => _MybuttonState();
}

class _MybuttonState extends State<Mybutton> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTapDown: (_) => setState(() {
        _scale = 0.95;
      }),
      onTapUp: (_) => setState(() {
        _scale = 1.0;
      }),
      onTapCancel: () => setState(() {
        _scale = 1.0;
      }),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 100),
        scale: _scale,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 5,
                color: Colors.black.withOpacity(0.5),
              ),
            ],
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(colors: [Colors.indigo, Colors.blue]),
          ),
          width: double.infinity,
          child: ElevatedButton(
            // icon: const Icon(Icons.camera_alt, color: Colors.white),
            child: Text(
              widget.Data,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: widget.onPressed,
          ),
        ),
      ),
    );
  }
}
