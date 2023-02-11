// ignore_for_file: unused_local_variable, empty_catches, unnecessary_null_comparison, unused_element, avoid_print, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yorportfolio/services/helper.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //LOG-IN
  Future logInwithEmailandPassword(String email, String password) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {
        //CALL OUR DATABASE SERVICE TO UPDATE THE USER DATA.
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //REGISTER
  Future registerUserWithEmailAndPassword(String email, String password) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {
        //CALL OUR DATABASE SERVICE TO UPDATE THE USER DATA.
        await DatabaseService(uid: user.uid).saveUserData(email);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN-OUT
  Future signOut() async {
    try {
      await HelperFunctions.saveUserLoggedInStatus(false);
      await HelperFunctions.saveUserEmailSF("");
      await firebaseAuth.signOut();
    } catch (e) {
      return null;
    }
  }
}

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  //REFERENCE TO OUR COLLLECTION
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  //UPDATING THE USER DATA
  Future saveUserData(String email) async {
    return await userCollection.doc(uid).set({"email": email, "uid": uid});
  }

  //GETTING USER DATA
  Future getUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }
}
