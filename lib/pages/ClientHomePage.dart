import 'package:flutter/material.dart';
import 'package:mobilemidny/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';

import 'CallPage.dart';

class ClientHomePage extends StatefulWidget {
  @override
  _ClientHomePageState createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  final myController = TextEditingController();
  bool _validateError = false;
  String name;
  TextStyle style = TextStyle(fontSize: 20,color: Colors.white);
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    FirebaseServices services = FirebaseServices();
    services.signinAnonimously();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Appointment Booking'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            physics: BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: NetworkImage(
                        'https://img2.pngio.com/doctor-png-transparent-images-png-all-dr-png-597_867.png'),
                    height: MediaQuery.of(context).size.height * 0.17,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:15.0,right: 15),
                    child: TextFormField(
                      onChanged: (val){
                        setState(() {
                          name = val;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: "Name"
                      ),
                      validator: (val){
                        if(val.isEmpty){
                          return "Name is Required";
                        }
                      },
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  MaterialButton(
                    color: Colors.blue,
                    onPressed: (){
                      if(_formKey.currentState.validate()){
                       onJoin(name);
                      }
                    },
                    child: Text("Call To Book Appointment",style: TextStyle(fontSize: 18,color: Colors.white),),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  Text(
                    'The Patient Comes First Each And Every Time.You are our priority, you and your family are treated with the utmost care, concern, and personal attention.',
                   textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.lightBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(80)
                        )
                      ),
                      elevation: 5.5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text("Why Us?",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
                            Text("1. With our broad range of integrated medical services, we are able to provide efficient, high-quality medical care in the convenience of your own home.",style: style,),
                            Text("2. It is difficult enough to manage mobility issues in this busy city. The added burden of arranging transportation and traveling to your doctor’s office for frequent healthcare is sometimes a deterrent to receiving the care you really needed. This burden is no longer necessary.",style: style,),
                            Text("3. Our providers can successfully provide culturally competent care in the various ethnic Communities across New York City and the greater New York area.",style: style,),
                            Text("4. This means we are committed to lessening your burden by providing you with medical care in the comfort of your own home.",style: style,),
                            Text("5. Our Motto in life is” Medicine is without borders “ and “ The patient comes first and every time”",style: style,),
                            Text("6. Because of you are our priority, you and your family are treated with the utmost care, concern and personal attention.",style: style,)
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onJoin(String name) async {
    print("Press");
    await _handleCameraAndMic(Permission.camera);
    await _handleCameraAndMic(Permission.microphone);
    FirebaseServices services = FirebaseServices();
    services.makeCall(context, name);

  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }
}
