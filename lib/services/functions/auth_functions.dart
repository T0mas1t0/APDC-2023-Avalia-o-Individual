import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:avaliacao_individual/services/functions'
    '/firebase_functions.dart';
import 'package:logging/logging.dart';

class AuthServices {
  final log = Logger('Auth Services class');

  static Future<int> signupUser(
      password,
      email,
      fullName,
      userName,
      phone,
      cellPhone,
      occupation,
      workplace,
      address,
      complementaryAddress,
      bool privacy,
      BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseAuth.instance.currentUser!.updateDisplayName(fullName);
      await FirebaseAuth.instance.currentUser!.updateEmail(email);
      await FirestoreServices.saveUser(
          'USER',
          email,
          userName,
          fullName,
          phone,
          cellPhone,
          occupation,
          workplace,
          address,
          complementaryAddress,
          userCredential.user!.uid,
          privacy,
          0);
      return 1;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password Provided is too weak')));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email Provided already Exists')));
      }
      return 0;
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      return -1;
    }
  }

  static Future<int> signinUser(
      String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      //.then(
      //(doc) => log.fine("Loged in"),
      //onError: (e) => log.severe("Error login in to account $e"),);
      return 1;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No user Found with this Email')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password did not match')));
      }
    }
    return 0;
  }
}
