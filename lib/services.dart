import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> makeCall(context,name,callID)async{
    firestore.collection('calls').doc(FirebaseAuth.instance.currentUser.uid).set({
      'callID': callID,
      'name' : name
    });
    await Future.delayed(Duration(seconds: 10)).then((value){
       firestore.collection('calls').doc(FirebaseAuth.instance.currentUser.uid).delete();
    });
  }
  Future<void> endCall()async{

  }
  signinAnonimously()async{
   await FirebaseAuth.instance.signInAnonymously().then((value) => print(value.user.uid));
  }
}