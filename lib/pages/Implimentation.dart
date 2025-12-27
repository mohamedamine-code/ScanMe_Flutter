import 'dart:convert';

import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      '',
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
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              "assets/img/pexels-jplenio-1103970.jpg",
              fit: BoxFit.cover,
            ),
          ),
          
          Align(
            alignment: Alignment(0, 0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15),
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
