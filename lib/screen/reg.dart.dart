import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:Terminal/screen/terminal.dart';
import 'package:Terminal/screen/terminal.dart';




class MyReg extends StatefulWidget {
  @override
  _MyRegState createState() => _MyRegState();
}

class _MyRegState extends State<MyReg> {
  var authc = FirebaseAuth.instance;

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
        backgroundColor: Colors.yellow,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.person), onPressed: null)
        ],
      ),
      body: Center(
        
        child: Container(
          margin: EdgeInsets.only(top: 10),
          width: 300,
          child: Column(
        children: <Widget>[
          SizedBox(
            height: 70,
          ),
          TextField(
            onChanged:(value)
            {
              email = value;
            },
            decoration: InputDecoration(
                hintText: 'Email',
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                )
            ),
          ),  

          SizedBox(
            height:20,
          ),

           TextField(
            onChanged:(value)
            {
              password = value;
            },
            decoration: InputDecoration(
                hintText: 'Password',
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                )
            ),
          ),
           
         SizedBox(
            height: 20,
          ),

         Material(
            color: Colors.yellow.shade400,
            borderRadius: BorderRadius.circular(20),
            elevation: 35,
            child:MaterialButton(
              minWidth: 200,
              height: 40,
              child: Text('submit'),
              onPressed: () async {
              try
              {
                var user = await authc.createUserWithEmailAndPassword(email: email, password: password);
                print(email);
                      print(password);
                      print(user);
    
               if (user.additionalUserInfo.isNewUser == true) {
                        
                        Navigator.pushNamed(context, "linuxcmd");
                      }
              }
               catch (e) {
                      print(e);
               }
              }
               
              )

          ),
        ],
      ),
        ),
      ),
      
    );
  }
}