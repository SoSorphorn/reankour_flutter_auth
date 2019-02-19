import 'package:flutter/material.dart';
import 'package:appbeginning/Reankour/models/tutor.dart';

class TutorListPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TutorListPageState();
  }
}

class _TutorListPageState extends State<TutorListPage>{
  List<bool> _tutorlist = new List<bool>();

  @override
  void initState(){
    setState(() {
      for(int i=0; i<10;i++){
        _tutorlist.add(false);
      }
    });
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new ListView.builder(
        itemCount: _tutorlist.length,
        itemBuilder: (BuildContext context, int index){
          return new Card(
            child: new Container(
              padding: EdgeInsets.all(35.0),
              child: new Column(
                children: <Widget>[
                  new Text('This is item,${index}'),
                ],
              ),
            ),
          );
        }
      ),
    );
  }

  Widget _showBody(){
    return new Container(
      child: new ListView.builder(
        itemCount: _tutorlist.length,
        itemBuilder: (BuildContext context, int index){
          return new Card(
              child: new Container(
                padding: EdgeInsets.all(32.0),
                child: new Column(
                  children: <Widget>[
                    new Text('New list tutor${index}'),
                  ],
                ),
              ) ,
            );
        },
      ),
    );
  }

  Widget _showTutorPage(){
    return new Container(
      child: new ListView.builder(
        itemCount: _tutorlist.length,
        itemBuilder: (BuildContext context, int index){
          return new Card(
            child: new Container(
              padding:  EdgeInsets.all(35.0),
              child: new Column(
                children: <Widget>[
                  new Text("Tutor List${index}"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _showTutorProfile(){
    return new Container(
      child: new ListView.builder(
        itemCount: _tutorlist.length,
        itemBuilder: (BuildContext context, int index){
          return new Card(
            child: new Container(
              padding: EdgeInsets.all(35.0),
              child: new Column(
                children: <Widget>[
                  new Text(
                    "Tutor profile${index}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                     color: Colors.blue,
                     fontSize: 20,
                     fontFamily: 'Robert',
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
 

}