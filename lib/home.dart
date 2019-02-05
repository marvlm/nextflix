import 'package:flutter/material.dart';
import 'package:nextflix_test1/carousel.dart';

class NextFlixHome extends StatelessWidget {
  NextFlixHome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    Widget _drawAppBar() {
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
      body: ListView(
        shrinkWrap: false,
        padding: const EdgeInsets.all(0.0),
        children: <Widget>[
          _drawTitle('EN CARTELERA'),
          FlixCarousel(
            movie: 'Aquaman',
            poster:
                'https://image.tmdb.org/t/p/w500/5A2bMlLfJrAfX9bqAibOL2gCruF.jpg',
            aspectRatio: 2.0,
            viewportFraction: 0.9,
            autoPlay: true,
            distortion: true,
            cover: true,
          ),
          _drawTitle('TENDENCIAS'),
          FlixCarousel(
            movie: 'Mortal Engines',
            poster:
                'https://image.tmdb.org/t/p/w500/uXJVpPXxZO4L8Rz3IG1Y8XvZJcg.jpg',
            aspectRatio: 1.9,
            viewportFraction: 0.35,
            autoPlay: false,
            distortion: false,
            cover: false,
          ),
          _drawTitle('PRÓXIMAMENTE'),
          FlixCarousel(
            movie: 'First Man',
            poster:
                'https://image.tmdb.org/t/p/w500/i91mfvFcPPlaegcbOyjGgiWfZzh.jpg',
            aspectRatio: 1.9,
            viewportFraction: 0.35,
            autoPlay: false,
            distortion: false,
            cover: false,
          ),
          _drawTitle('SERIES DE TV POPULARES'),
          FlixCarousel(
            movie: 'The Grinch',
            poster:
                'https://image.tmdb.org/t/p/w500/stAu0oF6dYDhV5ssbmFUYkQPtCP.jpg',
            aspectRatio: 1.9,
            viewportFraction: 0.35,
            autoPlay: false,
            distortion: false,
            cover: false,
          ),
          _drawTitle('TENDENCIA EN TV'),
          FlixCarousel(
            movie: 'The Girl in the Spiders Web',
            poster:
                'https://image.tmdb.org/t/p/w500/w4ibr8R702DCjwYniry1D1XwQXj.jpg',
            aspectRatio: 1.9,
            viewportFraction: 0.35,
            autoPlay: false,
            distortion: false,
            cover: false,
          ),
          _drawTitle('MÁS VOTADAS'),
          FlixCarousel(
            movie: 'Venom',
            poster:
                'https://image.tmdb.org/t/p/w500/2uNW4WbgBXL25BAbXGLnLqX71Sw.jpg',
            aspectRatio: 1.9,
            viewportFraction: 0.35,
            autoPlay: false,
            distortion: false,
            cover: false,
          ),
        ],
      ),
    );
  }
}
