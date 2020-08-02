import 'package:authenty/screens/landing_screen.dart';
import 'package:authenty/screens/consult_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: HomePage()),
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: LandingScreen(),
      initialRoute: '/',
      routes: {
        '/consult': (context) => ConsultScreen(),
      },
      theme: ThemeData(
          backgroundColor: Colors.white,
          primaryColor: Color(0XFF030047),
          accentColor: Color(0xFF030047),
          highlightColor: Color(0xFFB7B7D2),
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Color(0XFF030047),
            ),
            headline2: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Color(0XFF030047),
            ),
          )),
    );
  }
}
