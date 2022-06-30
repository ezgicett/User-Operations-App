import 'package:flutter/material.dart';
import 'package:test_pro/pages/login.dart';
import 'package:test_pro/pages/register.dart';
import 'firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/user_model.dart';

class Auth extends StatefulWidget {
    static const String routeName = '/auth';
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final Firestore _firestore = Firestore();

    //login
    Future<UserModel?> signIn(String email, String password) async {
      var user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return firebaseUser(user.user);
    }


    Future<UserModel?> signInAnonym() async {
      var _usercred = await _auth.signInAnonymously();
      return firebaseUser(_usercred.user);
    }

    UserModel? firebaseUser( User? user) {
      if(user!=null)
        {
          return UserModel(uid: user.uid, email: user.email);

        }
        else {
        return null;
      }
      }

    Future<UserModel?> currentUser() async {
      try {
        return firebaseUser(_auth.currentUser);
      } catch (e) {
        print('An error has been occurred while trying to reach current user' + e.toString());
        return null;
      }
    }

    Future<bool> isUserExist(String email) async {
      try {
        return _firestore.userExists(email);
      } catch (e) {
        print('User is already exist' + e.toString());
        return false;
      }
    }

    signOut() async {
      return await _auth.signOut();
    }

    //registration
    Future<Object?> createPerson( String email, String password) async {
      var user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);


      var temp = await _firestore.addUser(firebaseUser(user.user)!);
        if(temp) {
          return user;
        }
        else {
          return null;
        }
    }

    Future<void> updatePerson( String uid, UserModel updateduser) async {
      var temp = await _firestore.updateUser(uid,updateduser);

    }

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool showSignIn = false;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return Login(
        toggleView: toggleView,
      );
    } else {
      return Register(toggleView: toggleView);
    }
  }
}