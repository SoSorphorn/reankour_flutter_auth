import 'package:flutter/material.dart';
import './Reankour/auth.dart';
import './Reankour/root_page.dart';
<<<<<<< HEAD
=======
import './Reankour/tab_navigation_page.dart';
>>>>>>> 56db83e79085409c7064f1858a583c16dca28176

void main() {
	runApp(
		MaterialApp(
      title: "ReanKour",
      debugShowCheckedModeBanner: false,
      theme: ThemeData( 
      primarySwatch: Colors.blue,
      ),
      home: RootPage(auth: new Auth()),
		)
	);
}
