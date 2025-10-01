import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:scan_me/component/MyButton.dart';
import 'package:scan_me/component/MyDrawer.dart';
import 'package:scan_me/component/MyTextFlied.dart';

class Implimentation extends StatefulWidget {

  @override
  State<Implimentation> createState() => _ImplimentationState();
}

class _ImplimentationState extends State<Implimentation> {
  TextEditingController idController =TextEditingController();

  TextEditingController Society_NameController =TextEditingController();

  TextEditingController Number_FloorsController =TextEditingController();

  TextEditingController Number_Technical_RoomController =TextEditingController();

  TextEditingController Number_CabinetController =TextEditingController();

  TextEditingController SwitcherController =TextEditingController();

  TextEditingController PortController =TextEditingController();
@override
void dispose() {
  idController.dispose();
  Society_NameController.dispose();
  Number_FloorsController.dispose();
  Number_Technical_RoomController.dispose();
  Number_CabinetController.dispose();
  SwitcherController.dispose();
  PortController.dispose();
  super.dispose();
}

Future<void> addElement() async {
  final url = "https://backend-scanme-1.onrender.com/components/insert-data";
  final uri = Uri.parse(url);

  final response = await http.post(uri,headers:{'Content-Type': 'application/json'},body:jsonEncode({
    '_id':idController.text ,
    'Society_Name':Society_NameController.text,
    'Number_of_Floors':Number_FloorsController.text,
    'Technical_Room_Number':Number_Technical_RoomController.text,
    'Cabinet_Number':Number_CabinetController.text,
    'Switcher':SwitcherController.text,
    'Port':PortController.text,
    'State_Port':true
  }));

if (response.statusCode >= 200 && response.statusCode < 300) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text(" ✅  Added successfully")),
  );
} else {
  // Show actual error
  final errorMsg = utf8.decode(response.bodyBytes);
  print(errorMsg);
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("Failed: $errorMsg")),
  );
}
  idController.clear();
  Society_NameController.clear();
  Number_FloorsController.clear();
  Number_Technical_RoomController.clear();
  Number_CabinetController.clear();
  SwitcherController.clear();
  PortController.clear();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Mydrawer(),
      // appBar: AppBar(
      //   leading: Builder(
      //     builder: (context) => IconButton(
      //       onPressed: () {
      //         Scaffold.of(context).openDrawer();
              
      //       },
      //       icon: Icon(Icons.menu),
      //       color: Colors.white,
      //     ),
      //   ),
      //   title: const Text(
      //     'Implimentation',
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontWeight: FontWeight.bold,
      //       letterSpacing: 1.2,
      //     ),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Colors.indigo,
      // ),
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              "assets/img/pexels-jplenio-1103970.jpg",
              fit: BoxFit.cover,
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 8.0),
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 15,
                  offset: Offset(0, 10),
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Builder(
                  builder: (context) => IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(Icons.menu),
                    // color: Colors.white,
                  ),
                ),
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
          
          Align(
            alignment: Alignment(0, 0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Card(
                shadowColor: Colors.blueAccent,
                elevation: 10,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top:10.0,left: 15.0,right: 15.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20,),
                        MyTextFlied(labelText: "_id",controller: idController,),
                        const SizedBox(height: 20),
                        MyTextFlied(labelText: "Society Name",controller: Society_NameController,),
                        const SizedBox(height: 20),
                        MyTextFlied(labelText: "Number Floors",controller: Number_FloorsController),
                        const SizedBox(height: 20),
                        MyTextFlied(labelText: "Number Technical Room",controller: Number_Technical_RoomController),
                        const SizedBox(height: 20),
                        MyTextFlied(labelText: "Number Cabinet",controller:Number_CabinetController),
                        const SizedBox(height: 20),
                        MyTextFlied(labelText: "Switcher",controller: SwitcherController),
                        const SizedBox(height: 20),
                        MyTextFlied(labelText: "Port",controller: PortController),
                        const SizedBox(height: 30),
                    
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Mybutton(Data: 'Submit', onPressed: () async{
                            await addElement();
                            print("pressed");
                          }),
                        ),
                        const SizedBox(height: 20,),
              
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
