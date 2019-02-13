import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:appbeginning/Reankour/tutor_page.dart';
import 'package:appbeginning/Reankour/aboutus_page.dart';
import 'package:appbeginning/Reankour/contactus_page.dart';


class TabNavigation extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TabNavigationState();
  }
}

class _TabNavigationState extends State<TabNavigation>{
  int _currentIndex = 0;
  @override

  Widget _callPage(int currentIndex){
    switch(currentIndex){
      case 0: return TutorPage();
      case 1: return AboutUsPage();
      case 2: return ContactUsPage();

      break;
      default: TutorPage();
    }
  }
  Widget build(BuildContext context) {
    // TODO: implement build
   return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
           ),
          body: Container(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (value){
              _currentIndex = value;
              setState(() {
                _callPage(_currentIndex);
              });
            },
           items: [
              new BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.mail),
                title: Text('Messages'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text('Profile')
              )
            ],
          ),
        ),
      ),
    );
  }

}