import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'globalvars.dart';
import 'ipchoice.dart';
import 'socket.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double _cps = 10;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(50),
                width: 300,
                height: 160,
                child: ElevatedButton.icon(
                  label: Text(
                    "Toggle ($toggled)",
                    style: TextStyle(
                      fontFamily: 'Sono',
                      fontWeight: FontWeight.bold,
                      color: bg_color,
                    ),
                  ),
                  icon: Icon(
                    Icons.mouse,
                    color: bg_color,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary_color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // <-- Radius
                    ),
                  ),
                  onPressed: () => {
                    setState(() {
                      toggle();
                      setState(() {print("toggled");});
                    })
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(25, 50, 10, 50),
                    width: 200,
                    height: 200,
                    alignment: Alignment.center,
                    child: Slider(
                      activeColor: primary_color,
                      inactiveColor: accent_color,
                      value: _cps,
                      max: 30,
                      min: 10,
                      divisions: 20,
                      label: _cps.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _cps = value;
                        });
                      },
                    ),

                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 50, 25, 50),
                    width: 150,
                    height: 150,
                    child: ElevatedButton.icon(
                      label: Text(
                        "Update",
                        style: TextStyle(
                          fontFamily: 'Sono',
                          fontWeight: FontWeight.bold,
                          color: bg_color,
                        ),
                      ),
                      icon: Icon(
                        Icons.update,
                        color: bg_color,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary_color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // <-- Radius
                        ),
                      ),
                      onPressed: () => {
                        update(_cps)
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(25, 50, 10, 50),
                    width: 150,
                    height: 160,
                    child: ElevatedButton.icon(
                      label: Text(
                        "Esci",
                        style: TextStyle(
                          fontFamily: 'Sono',
                          fontWeight: FontWeight.bold,
                          color: bg_color,
                        ),
                      ),
                      icon: Icon(
                        CupertinoIcons.arrow_right_square_fill,
                        color: bg_color,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary_color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // <-- Radius
                        ),
                      ),
                      onPressed: () => {
                        setState(() {
                          disconnect(context);
                        })
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 50, 25, 50),
                    width: 150,
                    height: 160,
                    child: ElevatedButton.icon(
                      label: Text(
                        "Spegni",
                        style: TextStyle(
                          fontFamily: 'Sono',
                          fontWeight: FontWeight.bold,
                          color: bg_color,
                        ),
                      ),
                      icon: Icon(
                        CupertinoIcons.bolt_circle_fill,
                        color: bg_color,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary_color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // <-- Radius
                        ),
                      ),
                      onPressed: () => {
                        setState(() {
                          close(context);
                        })
                      },
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
