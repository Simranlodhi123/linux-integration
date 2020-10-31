import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:Terminal/screen/home.dart';
import 'package:Terminal/screen/login.dart';

import 'package:Terminal/screen/reg.dart';
import 'package:Terminal/screen/terminal.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "home",
      routes: {
        "home": (context) => MyHome(),
        "reg": (context) => MyReg(),
        "login": (context) => MyLogin(),
        "linuxcmd":(context) => Lcmd(),
      },
    ),
  );
}




