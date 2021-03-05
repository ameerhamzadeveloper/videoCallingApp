import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobilemidny/pages/CallPage.dart';

class FirebaseServices{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> makeCall(context,name,callID)async{
    firestore.collection('calls').doc(FirebaseAuth.instance.currentUser.uid).set({
      'callID': callID,
      'name' : name
    });
  }
  Future<void> endCall()async{
    await firestore.collection('calls').doc(FirebaseAuth.instance.currentUser.uid).delete();
  }
  signinAnonimously()async{
   await FirebaseAuth.instance.signInAnonymously().then((value) => print(value.user.uid));
  }
}