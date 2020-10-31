  
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


class Lcmd extends StatefulWidget {
  @override
  _LcmdState createState() => _LcmdState();
}

class _LcmdState extends State<Lcmd> {
  var data;
  var cmd;
  var useremail;
  var fc =
      TextEditingController(); 
  var fbconn =
      FirebaseFirestore.instance;
  var auth =
      FirebaseAuth.instance;


  firebasedata(cmd) async {
     useremail = auth.currentUser.email;
     fbconn = FirebaseFirestore.instance;
    var url = "http://192.168.43.55/cgi-bin/web.py?x=${cmd}";
    var response = await http.get(url);

    setState(() {
      data = response.body;
    });

    print(data);
    
      fbconn.collection("linux_ss").add({
       
      "name": useremail, 
      'command': "${data}" 
    });

  
   }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(' Terminal'),
          backgroundColor: Colors.black,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.laptop_windows), onPressed: (){print('pressed');})
          ],
        ),
        body: Stack(
          children: <Widget>[
            
//----
            
//----
                
            Container(
              margin: EdgeInsets.fromLTRB(10, 40, 20, 20),
              child: TextField(
                controller: fc,
                onChanged: (value) {
                  cmd = value;
                },
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                
                cursorColor: Colors.black38,
                decoration: InputDecoration(
                  hintText: 'Enter Command',
                 border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                 ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.fromLTRB(10, 125, 10, 10),
              child: Material(
                color: Colors.black,
                
                child: MaterialButton(
                  onPressed: () async {
                    firebasedata(cmd);
                    fc.clear();

                  },
                  child: Text(
                    'Run Command',
                    style: TextStyle(
                      fontSize: 10,
                     color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 200, 10, 10),
             
              color: Colors.white,
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Text(
                    data ?? " ", 
                    textAlign: TextAlign.center,
                     style:
                     TextStyle(
                       color: Colors.black,
                      fontSize: 20,
                    ),
                
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
