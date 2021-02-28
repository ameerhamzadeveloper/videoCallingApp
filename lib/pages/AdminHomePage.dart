import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';

import 'CallPage.dart';

class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  final myController = TextEditingController();
  bool _validateError = false;
  var strm = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Admin Home'),
        elevation: 0,
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: strm.collection('calls').snapshots(),
          builder: (context,snapshot){
            if(snapshot.hasData){
               if(snapshot.data.docs.length != 0){
                 Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => CallPage(channelName: snapshot.data.docs[0]['callID']),
                     ));
               }else{
                 return Center(child: Text("NON data"));
               }
            }else{
              return Center(child: Text("Waiting for Clients call...."),);
            }
          },
        )
      ),
    );
  }

  Future<void> onJoin(callID) async {
    setState(() {
      myController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });

    await _handleCameraAndMic(Permission.camera);
    await _handleCameraAndMic(Permission.microphone);

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(channelName: callID),
        ));
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }
}
