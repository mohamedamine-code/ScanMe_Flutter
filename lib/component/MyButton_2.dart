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
    final size= MediaQuery.of(context).size;
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
          width: size.width * 0.6,
          height: size.width * 0.6,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.indigo, Colors.blue]),
            // color: Colors.blue,
            // shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 15,
                offset: Offset(0, 10),
              ),
              BoxShadow(
                color: Colors.blue.withOpacity(0.5),
                blurRadius: 10,
                offset: Offset(0, 7),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
