import 'package:flutter/material.dart';
import 'package:nextflix_test1/home.dart';

void main() => runApp(NextFlix());

class NextFlix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NextFlix',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF1C2429),
        accentColor: const Color(0xFFff0000),
        scaffoldBackgroundColor: const Color(0xFF1C2429),
      ),
      home: NextFlixHome(title: 'NextFlix'),
    );
  }
}