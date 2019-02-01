import 'package:flutter/material.dart';
import './Reankour/login_page.dart';
import './Reankour/auth.dart';
import './Reankour/root_page.dart';

void main() {
	runApp(
		MaterialApp(
			// title: "Interest Calculate App",
      title: "NoteKeeper",
      debugShowCheckedModeBanner: false,
			// home: FavoriteCity(),
      // home: InterestCalculator(),
      // theme: ThemeData(
      //   brightness: Brightness.dark,
      //   primaryColor: Colors.indigo,
      //   accentColor: Colors.indigoAccent,
      // ), //Calculator interest
      theme: ThemeData(
      //  primarySwatch: Colors.deepPurple, 
      primarySwatch: Colors.blue,
      ),
      // home: LoginPage(auth: new Auth()),
      home: RootPage(auth: new Auth()),
      // home: LoginPage(),
		)
	);
}
