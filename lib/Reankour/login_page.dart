import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';

class LoginPage extends StatefulWidget{
  LoginPage({this.auth, this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPageState();
  }
}

enum FormType{
  login,
  register
}
class _LoginPageState extends State<LoginPage>{
  bool _isLoading;
  String _email;
  String _password;
  FormType _formType = FormType.login;
  final formKey = new GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textstyle = Theme.of(context).textTheme.title;
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("ReanKour"),
      ),
      body: new Stack(
        children: <Widget>[
          _showBody(),
          _showCircularProgress(),
        ],
      ),
    );
  }

//Function show body 
Widget _showBody(){
  return new Container(
    padding: EdgeInsets.all(1),
    child: new Form(
      key: formKey,
      child: ListView(
        children: <Widget>[
          _getImageAsset(),
          _showInputEmail(),
          _showInputPassword(),
          _showPrimaryButton(),
          _showSecondaryButton(),
        ],
      ),
    ),
  );
}

//Function show progress bar
Widget _showCircularProgress(){
  if (_isLoading == true)  {
    return Center(child: CircularProgressIndicator());
  } return Container(height: 0.0, width: 0.0,);
}

//Function Add logo
  Widget _getImageAsset(){
    AssetImage assetImage = AssetImage('images/logo.ico');
    Image image = Image(image: assetImage,width: 200.0,height: 200.0,);
    return Container(child: image,margin: EdgeInsets.all(5.0),);
  }

//Function input email 
Widget _showInputEmail(){
  TextStyle textstyle = Theme.of(context).textTheme.title;
    return Padding(
      padding: EdgeInsets.all(1.0),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: TextFormField(
            style: textstyle,
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            validator: (String value){
              if (value.isEmpty){
                return "Please enter correct email";
              }
            },
            onSaved: (value) => _email = value,
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: textstyle,
              errorStyle: TextStyle(
                color: Colors.red,
                fontSize: 10.0,
              ),
              hintText: "Please enter email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        ), 
      );
}
//Function input password
Widget _showInputPassword(){
  TextStyle textstyle = Theme.of(context).textTheme.title;
  return Padding(
    padding: EdgeInsets.all(1.0),
    child: Padding(
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
        style: textstyle,
        // keyboardType: TextInputType.number,
        obscureText:true,
        controller: passwordController,
        validator: (String value){
          if (value.isEmpty){
            return "Please enter correct password";
          }
        },
        onSaved: (value) => _password = value,
        decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: textstyle,
          errorStyle: TextStyle(
            color: Colors.red,
            fontSize: 10.0,
          ),
          hintText: "Plese enter Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    ),
  );
}

// Function check button login or sign up
Widget _showPrimaryButton(){
  return Padding(
    padding: EdgeInsets.all(20.0),
    child: RaisedButton(
      color: Colors.blueAccent,
      textColor: Colors.white,
      child: _formType == FormType.login? 
      new Text("Login",style: new TextStyle(fontSize: 20)) :
      new Text("Register",style: new TextStyle(fontSize: 20)),
      onPressed: (){validateAndSubmit();},
    ),
  );
}

//Function check whether user have account or not
Widget _showSecondaryButton(){
  return Padding(
    padding: EdgeInsets.all(40.0),
    child: new FlatButton(
      child: _formType == FormType.login? 
            new Text("Create a new account?",textAlign: TextAlign.center,style: new TextStyle(color: Colors.blue,fontSize: 20.0,), ) 
          : new Text("Have account yet?",textAlign: TextAlign.center,style: new TextStyle(color: Colors.blue,fontSize: 20.0,), ) ,
      onPressed: _formType == FormType.login? moveToRegister : moveToLogin,
    ),
  );
}


  //Function check validation when submit 
  bool validateAndSave(){
    final form = formKey.currentState;
    if (form.validate()){
      form.save();
      return true;
    } else {
      return false;
    }
  }
  void validateAndSubmit() async{
    setState(() {
      _isLoading = true;
    });
    if (validateAndSave()){
      try{
        if (_formType == FormType.login){
          String userId =  await widget.auth.signInWithEmailAndPassword(_email, _password);
          // FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
          // print("Sign up: ${user.uid}");
          print ("SignUp: ${userId}");
        }else{
          // FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
          // print("Register user: ${user.uid}");
          String userId = await widget.auth.createUserWithEmailAndPassword(_email,_password);
          print ("Registerd user:${userId}");
        }

      }
      catch(e){
        _isLoading = false;
        print("Error $e");
      }
    }
  }

  void moveToRegister(){
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin(){
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  
}