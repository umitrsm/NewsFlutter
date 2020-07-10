import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App Demo',
      theme: ThemeData(
        primaryColor: Colors.red,
        textTheme: GoogleFonts.ralewayTextTheme(Theme.of(context).textTheme),
      ),
      home: MainScreen(),
    );
  }
}
