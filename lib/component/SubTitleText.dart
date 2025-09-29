import 'package:flutter/material.dart';

class Subtitletext extends StatelessWidget {
  final String data; 
  const Subtitletext({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Text(data,style: TextStyle(fontSize: 17,color: Colors.grey),);
  }
}