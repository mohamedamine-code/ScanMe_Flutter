import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scan_me/component/SubTitleText.dart';
import 'package:scan_me/component/TitleText.dart';
import 'package:scan_me/models/device.dart';

class Mycard extends StatefulWidget {
  final DeviceInfo Device;
  const Mycard({required this.Device});

  @override
  State<Mycard> createState() => _MycardState();
}

class _MycardState extends State<Mycard> {


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Titletext(data: "Socity Name"),
                Subtitletext(data: "Transtu"),
                Titletext(data: "Socity Name"),
                Subtitletext(data: "Transtu"),
                Titletext(data: "Socity Name"),
                Subtitletext(data: "Transtu"),
                Titletext(data: "Socity Name"),
                Subtitletext(data: "Transtu"),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Titletext(data: "Socity Name"),
                Subtitletext(data: "Transtu"),
                Titletext(data: "Socity Name"),
                Subtitletext(data: "Transtu"),
                Titletext(data: "Socity Name"),
                Subtitletext(data: "Transtu"),
                Titletext(data: "Socity Name"),
                Subtitletext(data: "Transtu"),
              ],),
          ],
        ),
      ),
    );
  }
}
