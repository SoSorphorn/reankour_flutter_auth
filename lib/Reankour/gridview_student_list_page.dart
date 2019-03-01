import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class StudentPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StudentStatePage();
  }
}

class _StudentStatePage extends State<StudentPage> {
  TabController _tabController;
  AnimationController _animationController;
  Animation _animation;
  List <String> _tutorList = new List();
  @override
  Widget build(BuildContext context) {
    _tabController = new TabController(length: 3);
    _animationController = new AnimationController(duration: Duration(seconds: 5));
    _animation = Tween(begin: 1.0, end: -1).animate(CurvedAnimation(
                
              )); 
    BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (int index){
        setState(() {
          var current_selected;
            _tabController = current_selected;
        });
      }
      );

    var tabBarItem =  new TabBar(
      tabs: [
        new Tab(
          icon: new Icon(
              FontAwesomeIcons.solidNewspaper,
          ),
        ),
        new Tab(
          icon: new Icon(
            FontAwesomeIcons.home,
          ),
        ),
      ],
      controller: _tabController,
      indicatorColor: Colors.black,
    );
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
      ),
    );
  }
  
}