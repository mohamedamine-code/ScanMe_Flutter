import 'package:flutter/material.dart';

class MyTextFlied extends StatelessWidget {
  final String labelText;
  const MyTextFlied({super.key,required this.labelText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 20,
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder()
        ),
      ),
    );
  }
}
