import 'package:flutter/material.dart';
class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Contact Us!"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5.5,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Contact Us",style: TextStyle(fontSize: 24),),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Icon(Icons.call,size: 20,),
                        SizedBox(width: 10,),
                        Text("1-888-486-0425",style: TextStyle(fontSize: 20),)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(Icons.email),
                        SizedBox(width: 10,),
                        Text("info@MobileMdNY.com",style: TextStyle(fontSize: 20),)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on),
                        SizedBox(width: 10,),
                        Text("Our Location",style: TextStyle(fontSize: 20),)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Text("Brooklyn, NY, 11229",style: TextStyle(fontSize: 20),)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
