
import 'package:flutter/material.dart';
import 'auth.dart';
import 'login_page.dart';

class RootPage extends  StatefulWidget{
    RootPage({this.auth});
    final BaseAuth auth;
   

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RootPageState();
  }

}
enum AuthStatus{
  notSignedIn,
  signedIn
}
class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.notSignedIn;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.auth.currentUser().then((userId){
      setState(() {
        // authStatus = userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return new LoginPage(auth: widget.auth);
      switch (authStatus){
        case AuthStatus.notSignedIn:
          return new LoginPage(auth: widget.auth);
        case AuthStatus.signedIn:
          return new Scaffold(
            body: new Container(
              child: new Text("Welcome Homepage"),
            )
          );

     }
  }
}
