import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Mycard extends StatelessWidget {
  const Mycard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), 
      ),
      child: Padding(
        padding: EdgeInsets.all(16), 
        child: Column(
          mainAxisSize: MainAxisSize.min, 
          crossAxisAlignment:
              CrossAxisAlignment.center, 
          children: [
            SizedBox(height: 10), 
            FaIcon(FontAwesomeIcons.building ,size: 50,),
            const Spacer(),
            Text(
              "Tanstu",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
            ),
            SizedBox(height: 20), 
            
          ],
        ),
      ),
    );
  }
}
