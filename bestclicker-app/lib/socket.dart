import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'ipchoice.dart';
import 'globalvars.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

Socket? socket;
int port = 42069;
var running = false;
var spegni = false;

Route _homepageRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Homepage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.5, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),

        child: child,
      );
    },
  );
}

errore_di_connessione(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: bg_color,
              titleTextStyle: TextStyle(color: primary_color),
              contentTextStyle: TextStyle(color: primary_color),
              title: Text("Errore di connessione"),
              content: Text("Controlla l'ip dell'autoclicker"),
              actions: <Widget>[
                TextButton(
                  child: Text("OK", style: TextStyle(color: primary_color),),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          }
      );
    },
  );
}


spegnimento(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: bg_color,
              titleTextStyle: TextStyle(color: primary_color),
              contentTextStyle: TextStyle(color: primary_color),
              title: Text("Spegnimento"),
              content: Text("Sei sicuro di voler spegnere l'autoclicker?"),
              actions: <Widget>[
                TextButton(
                  child: Text("Si", style: TextStyle(color: primary_color),),
                  onPressed: () {
                    spegni = true;
                    socket!.write("clse");
                    socket!.close();
                    socket!.destroy();
                    print("Disconnesso");
                    Navigator.of(context).pop();
                    Navigator.pop(context);
                  },
                ),
                TextButton(
                  child: Text("Annulla", style: TextStyle(color: primary_color),),
                  onPressed: () {
                    spegni = false;
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          }
      );
    },
  );
}

Future<void> connect(String ip, var context) async {
  print("Provando la connessione a $ip con la porta $port");
  connessione = true;
  try {
    socket = await Socket.connect(ip, port);
    socket!.listen((Uint8List event) {
      String temp = utf8.decode(event);
      if (temp.contains("on")) {
        toggled = "ON";
      }
      if (temp.contains("off")) {
        toggled = "OFF";
      }
    });
    connessione = false;
    print("Connesso con successo");
    Navigator.of(context).push(_homepageRoute());
  } catch (e) {
    connessione = false;
    print("Connessione fallita");
    errore_di_connessione(context);
  }
}

void update(double cps) {
  var _cps = cps.round();
  socket!.write("updt");
  sleep(const Duration(milliseconds: 50));
  socket!.write(_cps);
}

void toggle() {
  socket!.write("togl");
}

void disconnect(var context) {
  socket!.write("exit");
  socket!.close();
  socket!.destroy();
  print("Disconnesso");
  Navigator.pop(context);
}

void close(var context) {
  spegnimento(context);
}