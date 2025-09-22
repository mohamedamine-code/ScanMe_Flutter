import 'package:flutter/material.dart';
import 'package:scan_me/component/MyCard.dart';
import 'package:scan_me/component/MyDrawer.dart';

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
              print("ttt");
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
          Expanded(
            child: GridView.builder(
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Mycard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
