import 'package:flutter/material.dart';
import 'package:mobilemidny/pages/ClientHomePage.dart';
import 'package:mobilemidny/pages/contact.dart';
class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;
  List<Widget> screens = [
    ClientHomePage(),
    Contact()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: index,
          children: screens,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (val){
          setState(() {
            index = val;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: "Contact"
          ),
        ],
      ),
    );
  }
}
