import 'package:firebase_authproject/google_auth/homescreen.dart';
import 'package:firebase_authproject/services/firebaseServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 50,
          width: 200,
          child: SignInButton(
            Buttons.GoogleDark, 
            text: 'Sign in with Google',
            onPressed: ()async{
              await FirebaseServices().signInWithGoogle();
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
            }
            ),
        ),
      ),
    );
  }
}