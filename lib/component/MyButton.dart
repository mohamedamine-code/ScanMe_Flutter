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
    return GestureDetector(
      onTapDown:(_)=> setState(() {
        _scale=0.95;
      }),
      onTapUp: (_)=>setState(() {
        _scale=1.0;
      }),
      onTapCancel:()=>setState(() {
        _scale=1.0;      
        }),
      child: AnimatedScale(
        duration: const Duration(milliseconds:100),
        scale: _scale,
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 20,
          child: ElevatedButton.icon(
            icon: const Icon(Icons.open_in_new, color: Colors.white),
            label: Text(
              widget.Data,
              style: TextStyle(fontSize: 17, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo,
              padding: const EdgeInsets.symmetric(vertical: 14),
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
