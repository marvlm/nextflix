import 'package:flutter/material.dart';
import 'package:nextflix_test1/carousel.dart';

class NextFlixHome extends StatelessWidget {
  NextFlixHome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    Widget _drawAppBar(){
      return AppBar(
        elevation: 0.0,
        title: Image.asset(
          'images/NextFlix-logo-horizontal.png',
          height: 40.0,
        ),
      );
    }

    Widget _drawTitle(title) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 15.0, letterSpacing: 2.0),
        ),
      );
    }    

    return Scaffold(
      appBar: _drawAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _drawTitle('EN CARTELERA'),
          FlixCarousel(
            movie: 'Aquaman',
            poster: 'https://image.tmdb.org/t/p/w500/5A2bMlLfJrAfX9bqAibOL2gCruF.jpg',
            aspectRatio: 2.0,
            viewportFraction: 0.9,
            autoPlay: true,
          ),
        ],
      ),
    );
  }
}