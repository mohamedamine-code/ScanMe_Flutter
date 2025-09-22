import 'package:flutter/material.dart';
import 'package:scan_me/component/MyButton.dart';
import 'package:scan_me/component/MyDrawer.dart';
import 'package:scan_me/component/MyTextFlied.dart';

class Implimentation extends StatelessWidget {
  const Implimentation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Mydrawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
              print("ttt");
            },
            icon: Icon(Icons.menu),
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Implimentation',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            MyTextFlied(labelText: "_id"),
            const SizedBox(height: 20),
            MyTextFlied(labelText: "Society Name"),
            const SizedBox(height: 20),
            MyTextFlied(labelText: "Number Floors"),
            const SizedBox(height: 20),
            MyTextFlied(labelText: "Number Technical Room"),
            const SizedBox(height: 20),
            MyTextFlied(labelText: "Number Cabinet"),
            const SizedBox(height: 20),
            MyTextFlied(labelText: "Switcher"),
            const SizedBox(height: 20),
            MyTextFlied(labelText: "Port"),
            const SizedBox(height: 40),

            Mybutton(Data: 'Submit', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
