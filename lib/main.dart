// import 'package:firebase_authproject/google_auth/homescreen.dart';
// import 'package:firebase_authproject/google_auth/login.dart';
import 'package:firebase_authproject/services/firebaseServices.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'email_auth/home_screen.dart';
import 'email_auth/login_screen.dart';



void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyB-ptk64PnpCGUzSPKJv7TnwB8RyTyGENU", 
      appId: "1:277639512335:android:b852eabf3a8e530dca7e7a", 
      messagingSenderId: "277639512335", 
      projectId: "fir-auth-d1da4",
      authDomain: "fir-auth-d1da4.firebaseapp.com"
      )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Auth',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder(
        stream: FirebaseServices().firebaseAuth.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return HomeScreen();
          }
          return LoginScreen();
        }
      ),
      
    );
  }
}
