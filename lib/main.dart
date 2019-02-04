import 'package:flutter/material.dart';

void main() => runApp(NextFlix());

class NextFlix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NextFlix',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NextFlixHome(title: 'NextFlix'),
    );
  }
}

class NextFlixHome extends StatelessWidget {
  NextFlixHome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: Container(
                margin: new EdgeInsets.all(2.0),
                height: 250.0,
                width: 250.0,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage('images/NextFlix-logo.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
      ),
    );
  }
}