import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Terminal"),
        backgroundColor: Colors.blueAccent,
      ),
    
      body:
        Center(
        child: Column(
          children: <Widget>[
             SizedBox(
            height: 40,
          ),
           Card(
              child: Text('WELCOME TO LINUX TERMINAL',
             style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
            ),),),
      SizedBox(
            height: 140,
          ),

            
            Container(
              width: 300,
              height:190,
              child: Column(
                children: <Widget>
                [
                  Material(
                    color: Colors.blue.shade400,
                    borderRadius: BorderRadius.circular(20),
                    elevation: 10,
                    child:MaterialButton(
                      minWidth: 200,
                      height: 40,
                      child: Text('Register',
                       style: TextStyle(
                          fontSize: 20,
                         
                          color: Colors.black,),),
                      onPressed: ()
                      {
                        Navigator.pushNamed(context, "reg");
                      },)

                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Material(
                    color: Colors.blue.shade300,
                    borderRadius: BorderRadius.circular(20),
                    elevation: 10,
                    child:MaterialButton(
                      minWidth: 200,
                      height: 20,
                      child: Text('Login', style: TextStyle(
                          fontSize: 20,
                         
                          color: Colors.black,),),
                      onPressed: ()
                      {
                        Navigator.pushNamed(context, "login");
                      },),),


                ],
              ),
            ),
          ],
        ),
      ),
   
    );
  
    
  }
}
