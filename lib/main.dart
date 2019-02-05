import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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

class NextFlixHome extends StatelessWidget {
  NextFlixHome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Image.asset(
          'images/NextFlix-logo-horizontal.png',
          height: 40.0,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "EN CARTELERA",
              style: TextStyle(
                  color: Colors.white, fontSize: 15.0, letterSpacing: 2.0),
            ),
          ),
          CarouselSlider(
            items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map(
              (i) {
                return new Builder(
                  builder: (BuildContext context) {
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      child: Stack(
                        children: <Widget>[
                          Image.network(
                            'https://image.tmdb.org/t/p/w500/5A2bMlLfJrAfX9bqAibOL2gCruF.jpg',
                            fit: BoxFit.cover,
                            width: 1000.0,
                          ),
                          Positioned(
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(200, 0, 0, 0),
                                    Color.fromARGB(0, 0, 0, 0)
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              child: Text(
                                '$i Aquaman',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  letterSpacing: 1.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ).toList(),
            viewportFraction: 0.9,
            aspectRatio: 2.0,
            autoPlay: true,
          ),
        ],
      ),
    );
  }
}
