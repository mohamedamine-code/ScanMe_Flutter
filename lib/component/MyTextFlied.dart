import 'package:flutter/material.dart';

class MyTextFlied extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  const MyTextFlied({super.key,required this.labelText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 20,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.inversePrimary,
            )
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              // width: 5.5,
              color: Theme.of(context).colorScheme.inversePrimary,
            )
          )
        ),
      ),
    );
  }
}
