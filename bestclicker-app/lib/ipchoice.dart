import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'globalvars.dart';
import 'homepage.dart';
import 'socket.dart';

class ConnectScreen extends StatefulWidget {
  const ConnectScreen({Key? key}) : super(key: key);

  @override
  State<ConnectScreen> createState() => _ConnectScreenState();
}

class _ConnectScreenState extends State<ConnectScreen> {
  TextEditingController ipcontroller = TextEditingController();
  String ip = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(50, 50, 25, 50),
                    child: Icon(
                      Icons.mouse,
                      color: primary_color,
                      size: 45,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 50, 50, 50),
                    alignment: Alignment.center,
                    child: Text(
                      "best Clicker",
                      style: TextStyle(
                        fontFamily: 'Sono',
                        fontWeight: FontWeight.w100,
                        fontSize: 35,
                      ),
                    ),
                  ),
                ],

              ),
              Container(
                padding: EdgeInsets.all(50),
                width: 300,
                alignment: Alignment.center,
                child: TextField(
                  controller: ipcontroller,
                  cursorColor: primary_color,
                  decoration: InputDecoration(
                    hintText: 'IP del clicker',
                    hintStyle: TextStyle(
                      fontFamily: 'Sono',
                      fontWeight: FontWeight.normal,
                      color: primary_color,
                    ),
                    enabledBorder: new OutlineInputBorder(
                      borderSide: new BorderSide(
                        color: primary_color,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(22)),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderSide: new BorderSide(
                        color: primary_color,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(22)),
                    ),
                  ),
                  onChanged: (text) {
                    setState(() {
                      ip = text;
                      //you can access nameController in its scope to get
                      // the value of text entered as shown below
                      //fullName = nameController.text;
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(50),
                width: 300,
                height: 160,
                child: ElevatedButton.icon(
                  label: connessione ? Text("Connessione ..", style: TextStyle(fontFamily: 'Sono', fontWeight: FontWeight.bold, color: bg_color,),) : Text("Connettiti", style: TextStyle(fontFamily: 'Sono', fontWeight: FontWeight.bold, color: bg_color,),),
                  icon: connessione ? Icon(CupertinoIcons.arrow_2_circlepath, color: bg_color,) : Icon(CupertinoIcons.antenna_radiowaves_left_right, color: bg_color,),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary_color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // <-- Radius
                    ),
                  ),
                  onPressed: () => {
                    setState(() {
                      connect(ip, context);
                      connessione = false;
                    })
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
