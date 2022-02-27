import 'package:firebase_authproject/google_auth/login.dart';
import 'package:firebase_authproject/services/firebaseServices.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: ()async{
            await FirebaseServices().signOut();
            //Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
          }, icon: Icon(Icons.logout)),
        ],
      ),
    );
  }
}