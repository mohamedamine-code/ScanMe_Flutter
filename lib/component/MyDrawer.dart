import 'package:flutter/material.dart';
import 'package:scan_me/pages/HomePage.dart';
import 'package:scan_me/pages/Implimentation.dart';
import 'package:scan_me/pages/Viewdetails.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary,
            ),
            child: Center(
              child: Text(
                'SmartInventory',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => HomeScreen()),
                    );
                  },
                  child: ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Scan QR"),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Implimentation()),
                    );
                  },
                  child: ListTile(
                    leading: Icon(Icons.addchart),
                    title: Text("Implimentation"),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Viewdetails()),
                    );
                  },
                  child: ListTile(
                    leading: Icon(Icons.change_circle_rounded),
                    title: Text("View details"),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
