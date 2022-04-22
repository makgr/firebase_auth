import 'package:firebase_authproject/email_auth/login_screen.dart';
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
            await FirebaseServices().signOutemail();
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);
           }, icon: Icon(Icons.logout)),
        ],
      ),
    );
  }
}