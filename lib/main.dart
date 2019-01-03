import 'package:flutter/material.dart';
import 'screens/projects.dart';
import 'screens/acronyms.dart';

void main() => runApp(AcronymApp());

class AcronymApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Acronym',
      theme: new ThemeData(
          primaryColor: Colors.blueAccent
      ),
        home: Projects()
    );
  }
}