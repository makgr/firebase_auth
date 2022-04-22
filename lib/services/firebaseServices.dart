import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseServices {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<User?> signInWithGoogle()async{
    try {
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if(googleUser != null){
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken
        );
        UserCredential userCredential = await firebaseAuth.signInWithCredential(credential);
        return userCredential.user;
      }

    } catch (e) {
      print(e);
    }
  }

 Future signOut()async{
    await GoogleSignIn().signOut();
    await firebaseAuth.signOut();
 }

 Future<User?> register(String email, String password)async{
   try {
     UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
     return userCredential.user;
   }on FirebaseAuthException catch(e){
     SnackBar(content: Text(e.message.toString()), backgroundColor: Colors.red,);
   }catch (e) {
     print(e);
   }
 }

 Future signOutemail()async{
    await firebaseAuth.signOut();
 }

 Future<User?> login(String email, String password)async{
   try {
     UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
     return userCredential.user;
   }on FirebaseAuthException catch(e){
     SnackBar(content: Text(e.message.toString()), backgroundColor: Colors.red,);
   }catch (e) {
     print(e);
   }
 }

}