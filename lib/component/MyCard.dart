import 'package:flutter/material.dart';
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
    // Helper function to create a label-value row
    Widget _buildRow(String title, String value) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 160, // Fixed width for labels for alignment
              child: Titletext(data: title),
            ),
            Expanded(
              child: Subtitletext(data: ": "+value),
            ),
          ],
        ),
      );
    }

    return Card(
      elevation: 8,
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRow("ID", widget.Device.id),
            _buildRow("Society Name", widget.Device.societyName),
            _buildRow("Number of Floors", widget.Device.numberOfFloors),
            _buildRow("Technical Room", widget.Device.technicalRoomNumber),
            _buildRow("Cabinet Number", widget.Device.cabinetNumber),
            _buildRow("Switcher", widget.Device.switcher),
            _buildRow("Port", widget.Device.port),
            _buildRow("Port State", widget.Device.statePort ? "Active" : "Inactive"),
          ],
        ),
      ),
    );
  }
}