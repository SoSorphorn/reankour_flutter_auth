
import 'package:flutter/material.dart';
import 'package:appbeginning/Reankour/tutor_page.dart';
import 'package:appbeginning/Reankour/tutorlist_page.dart';
import 'package:appbeginning/Reankour/contactus_page.dart';
import 'package:appbeginning/Reankour/home_page.dart';
import 'auth.dart';

class TabNavigation extends StatefulWidget{

    TabNavigation({this.userId,this.auth,this.onSignedOut});
    final String userId;
    final BaseAuth auth;
    final VoidCallback onSignedOut;

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
      case 0: return TutorListPage();
      case 1: return HomePage();
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
            actions: <Widget>[
              new FlatButton(
                  child: new Text('Logout',
                      style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                      onPressed:  _signOut,
                  ),
            ],
            backgroundColor: Colors.blueAccent,
           ),
          body: _callPage(_currentIndex),
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
                icon: Icon(Icons.list),
                title: Text('todo'),
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

  _signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }


}

