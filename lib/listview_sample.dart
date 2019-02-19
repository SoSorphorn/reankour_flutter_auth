import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Example Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
    @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Center(
          child: new Text('Demo Flutter',
          style: new TextStyle(
            fontFamily: 'bebas-neue',
          ),),
        )
      ),
      body: new _MyList()
    );
  }
}
class _MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        padding: const EdgeInsets.all(20.0),
        itemBuilder: (context, i){
          return new ListTile(
            title: new Text('Usuarios Random', style: new TextStyle(
              fontFamily: 'bebas-neue',
            ),),
            subtitle: new Text('Activo', style: new TextStyle(
              fontFamily: 'bebas-neue',
              fontStyle: FontStyle.italic,
              color: Colors.green
            )),
            leading: const Icon(Icons.account_circle),
            trailing: new RaisedButton(
                child: new Text('Remove', style: new TextStyle(
                  fontFamily: 'bebas-neue',
                )),
                onPressed: (){
                  deleteDialog(context).then((value) {
                    print('Value is $value');
                  });
                }),
          );
        }
    );
  }
}
Future<bool> deleteDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Are you sure ?', style: new TextStyle(
            fontFamily: 'bebas-neue',
          )),
          actions: <Widget>[
            new FlatButton(
                child: new Text('Yes', style: new TextStyle(
                  fontFamily: 'bebas-neue',
                )),
                onPressed: (){
                  Navigator.of(context).pop(true);
                }
            ),
            new FlatButton(
                child: new Text('No', style: new TextStyle(
                  fontFamily: 'bebas-neue',
                )),
                onPressed: (){
                  Navigator.of(context).pop(false);
                }
            )
          ],
        );
      }
  );
}