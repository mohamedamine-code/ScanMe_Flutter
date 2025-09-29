import 'package:flutter/material.dart';
import 'package:scan_me/component/MyCard.dart';
import 'package:scan_me/component/MyDrawer.dart';
import 'package:scan_me/models/device.dart';

class Viewdetails extends StatelessWidget {
  const Viewdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Mydrawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
              // print("ttt");
            },
            icon: Icon(Icons.menu),
            color: Colors.white,
          ),
        ),
        title: const Text(
          'View Details',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: [
          // Expanded(
          //   child: Container(
          //     child: ListView.builder(
          //       itemCount: 4,
          //       itemBuilder: (BuildContext context, int index) {
          //         return Mycard();
          //       },
          //     ),
          //   ),
          // ),
          // Mycard(),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Mycard(
                  Device: DeviceInfo(
                    id: "id",
                    societyName: "societyName",
                    numberOfFloors: "numberOfFloors",
                    technicalRoomNumber: "technicalRoomNumber",
                    cabinetNumber: "cabinetNumber",
                    switcher: "switcher",
                    port: "port",
                    statePort: true,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
