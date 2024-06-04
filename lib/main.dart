import 'package:demo_work/searchbutton.dart';
import 'package:flutter/material.dart';

import 'model.dart';

List<dynamic> suggestions = [
  SampleModel(lastname: "muhammed", firstname: " najeeb"),
  SampleModel(lastname: "duglas", firstname: " sajin"),
  SampleModel(lastname: "duglas", firstname: "amos"),
  SampleModel(lastname: "duglas", firstname: "anush"),
];


void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        primaryColor: Colors.red,
        // textTheme: Typography.blackCupertino
    ),
    home: MyApp(),) );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Searching(hintText: "What are you seeking for ?",),
    );
  }
}
