import 'package:flutter/material.dart';
import 'package:scan_me/component/MyCard.dart';
import 'package:scan_me/component/MyDrawer.dart';
import 'package:scan_me/models/device.dart';

class Viewdetails extends StatelessWidget {
  const Viewdetails({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Example mock data (replace with your actual device list)
    final List<DeviceInfo> devices = [
      DeviceInfo(
        id: "001",
        societyName: "Green Heights",
        numberOfFloors: "12",
        technicalRoomNumber: "TR-05",
        cabinetNumber: "CAB-22",
        switcher: "SW-04",
        port: "P-10",
        statePort: true,
      ),
      DeviceInfo(
        id: "002",
        societyName: "Sky Towers",
        numberOfFloors: "8",
        technicalRoomNumber: "TR-03",
        cabinetNumber: "CAB-10",
        switcher: "SW-01",
        port: "P-08",
        statePort: false,
      ),
    ];

    return Scaffold(
      drawer: const Mydrawer(),
      appBar: AppBar(
        title: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      'Smart Inventory',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
      ),
      body: Stack(
        children: [
      
          SizedBox(
            width: size.width,
            height: size.height,
            child: Image.asset(
              "assets/img/pexels-jplenio-1103970.jpg",
              fit: BoxFit.cover,
            ),
          ),

          
          Padding(
            padding: const EdgeInsets.only(top: 40.0), 
            child: ListView.builder(
              itemCount: devices.length,
              itemBuilder: (context, index) {
                return Mycard(Device: devices[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
