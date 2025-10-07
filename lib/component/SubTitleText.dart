import 'package:flutter/material.dart';

class Subtitletext extends StatelessWidget {
  final String data; 
  const Subtitletext({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Text(data,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 17,color: const Color.fromARGB(255, 52, 48, 48)),);
  }
}