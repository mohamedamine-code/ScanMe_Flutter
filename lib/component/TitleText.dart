import 'package:flutter/material.dart';

class Titletext extends StatelessWidget {
  final String data;
  const Titletext({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Text(data,style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),);
  }
}