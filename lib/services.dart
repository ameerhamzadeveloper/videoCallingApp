import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobilemidny/pages/CallPage.dart';

class FirebaseServices{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String callID;
  Future<void> makeCall(context,name)async{
      var r = Random();
      const _chars = 'BCDEFGHIJKLMNOPQRSTUVWXYZ';
     callID = List.generate(5, (index) => _chars[r.nextInt(_chars.length)]).join();
    firestore.collection('calls').doc(FirebaseAuth.instance.currentUser.uid).set({
      'callID': callID,
      'name' : name
    });
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(channelName: callID),
        ));
  }
  Future<void> endCall()async{
    await firestore.collection('calls').doc(FirebaseAuth.instance.currentUser.uid).delete();
  }
  signinAnonimously()async{
   await FirebaseAuth.instance.signInAnonymously().then((value) => print(value.user.uid));
  }
}