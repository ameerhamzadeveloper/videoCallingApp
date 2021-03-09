import 'package:flutter/material.dart';
import 'package:mobilemidny/pages/AdminHomePage.dart';
import 'package:mobilemidny/pages/ClientHomePage.dart';
import 'package:mobilemidny/pages/bottom_nav_bar.dart';
class ConditionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Welcome!",style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                shape: StadiumBorder(),
                height: 50,
                minWidth: MediaQuery.of(context).size.width,
                color: Colors.lightBlueAccent,
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminHomePage()));
                },
                child: Text("Admin Side",style: TextStyle(fontSize: 18,color: Colors.white),),
              ),
              SizedBox(height: 20,),
              MaterialButton(
                shape: StadiumBorder(),
                height: 50,
                minWidth: MediaQuery.of(context).size.width,
                color: Colors.lightBlueAccent,
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => BottomNavBar()));
                },
                child: Text("Client Side",style: TextStyle(fontSize: 18,color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
