import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobilemidny/pages/bottom_nav_bar.dart';
import 'package:mobilemidny/pages/condition_screen.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 7),() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavBar())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network("https://img2.pngio.com/doctor-png-transparent-images-png-all-dr-png-597_867.png",height: 200,),
            SizedBox(height: 20,),
            Text("MobileMDNY",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
