import 'package:flutter/material.dart';
import 'package:flutterapp/models/news.dart';
import 'package:flutterapp/screens/news_detail_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import './screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  int position;
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
      routes: {
        'newsdetails': (ctx) => NewsDetailScreen(position),
      },
    );
  }
}
