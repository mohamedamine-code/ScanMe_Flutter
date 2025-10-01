import 'package:flutter/material.dart';
import 'package:scan_me/component/MyButton.dart';
import 'package:scan_me/pages/HomePage.dart';
import 'package:scan_me/pages/Implimentation.dart';
import 'package:scan_me/pages/Viewdetails.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: MediaQuery.of(context).size.height-50,
      child: Drawer(
        // shape: ,
        elevation: 5,
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 5),
                    blurRadius: 10,
                  ),
                ],
              gradient: LinearGradient(colors: [Colors.indigo, Colors.blue])
              ),
              child: Center(
                child: Text(
                  'Smart Inventory',
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
                  Mybutton(Data: "Scan QR Code", onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                  }),
                  const SizedBox(height: 20),
                  Mybutton(Data: "Implimentation ", onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Implimentation()));
                  }),
                  const SizedBox(height: 20),
                  Mybutton(Data: "View Details", onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Viewdetails()));
                  }),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
