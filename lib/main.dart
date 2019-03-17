import 'package:flutter/material.dart';
import './Reankour/auth.dart';
import './Reankour/root_page.dart';
import './Reankour/tab_navigation_page.dart';
import 'dart:async';
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
