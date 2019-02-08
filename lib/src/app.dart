import 'package:flutter/material.dart';
import 'package:nextflix_test1/src/ui/pages/home.dart';

class NextFlix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NextFlix',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF1C2429),
        accentColor: Colors.white,
        scaffoldBackgroundColor: const Color(0xFF1C2429),
      ),
      home: NextFlixHome(title: 'NextFlix'),
    );
  }
}