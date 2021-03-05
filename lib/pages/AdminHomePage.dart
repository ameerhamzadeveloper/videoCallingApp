import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jitsi_meet/feature_flag/feature_flag_enum.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'dart:async';

import 'package:jitsi_meet/jitsi_meeting_listener.dart';

class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  final myController = TextEditingController();
  var strm = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Admin Home',style: TextStyle(color: Colors.black),),
        // elevation: 0,
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: strm.collection('calls').snapshots(),
          builder: (context,snapshot){
            if(snapshot.hasData){
               if(snapshot.data.docs.length != 0){
                 // print(snapshot.data.docs[0]['name']);
                 joinMeeting(snapshot.data);
                 return Container();
               }else{
                 return Center(child: Text("Waiting for Clients call...."));
               }
            }else{
              return Center(child: Text("Waiting for Clients call...."),);
            }
          },
        )
      ),
    );
  }
  Future<void> joinMeeting(snapsot) async {
    try{
      Map<FeatureFlagEnum, bool> featureeFlags = {
        FeatureFlagEnum.WELCOME_PAGE_ENABLED : false,
      };
      if(Platform.isAndroid) {
        featureeFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
      } else if(Platform.isIOS) {
        featureeFlags[FeatureFlagEnum.PIP_ENABLED] = false;
      }
      var options = JitsiMeetingOptions()
        ..room = snapsot.docs[0]['callID'] // Required, spaces will be trimmed
        ..userDisplayName = snapsot.docs[0]['name']
        ..audioMuted = false
        ..videoMuted = false
        ..featureFlags.addAll(featureeFlags);
      await JitsiMeet.joinMeeting(
          options,
        listener: JitsiMeetingListener(onConferenceWillJoin: ({message}) {
          debugPrint("${options.room} will join with message: $message");
        }, onConferenceJoined: ({message}) {
          print("call joined........============>");
          debugPrint("${options.room} joined with message: $message");
        }, onConferenceTerminated: ({message}) {
          print("call end........============>");
          debugPrint("${options.room} terminated with message: $message");
        },
      ));
    } catch(err) {
      print(err);
    }
  }
}
