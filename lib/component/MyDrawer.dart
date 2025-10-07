import 'package:flutter/material.dart';
import 'package:scan_me/component/MyButton.dart';
import 'package:scan_me/pages/HomePage.dart';
import 'package:scan_me/pages/Implimentation.dart';
import 'package:scan_me/pages/Viewdetails.dart';
import 'package:scan_me/pages/login.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      // Slightly reduce height to avoid overflow on small screens
      height: MediaQuery.of(context).size.height - 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Drawer(
        elevation: 5,
        // backgroundColor: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            // Header
            DrawerHeader(
              decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.indigo, Colors.blueAccent]),
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 4))
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.inventory_2,
                        size: 32, color: Colors.indigo),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Text(
                      'Smart Inventory',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Buttons
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  Mybutton(
                    Data: "Scan QR Code",
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeScreen()));
                    },
                  ),
                  const SizedBox(height: 16),
                  Mybutton(
                    Data: "Implementation",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Implimentation()));
                    },
                  ),
                  const SizedBox(height: 16),
                  Mybutton(
                    Data: "View Details",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Viewdetails()));
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Mybutton(
                Data: "Logout",
                onPressed: () {
                  // your logout function here
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginPage()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
