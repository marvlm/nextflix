import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FlixCarousel extends StatelessWidget {
  FlixCarousel({
    Key key, 
    this.movie, 
    this.poster, 
    this.aspectRatio, 
    this.viewportFraction,
    this.autoPlay,
    this.distortion,
    this.cover}) : super(key: key);

  final String movie, poster;
  final double aspectRatio, viewportFraction;
  final bool autoPlay, distortion, cover;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map(
        (i) {
          return new Builder(
            builder: (BuildContext context) {
              return Card(
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      poster,
                      fit: this.cover ? BoxFit.cover : BoxFit.contain,
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
                          '$i $movie',
                          style: TextStyle(
                            color: this.cover ? Colors.white : Colors.transparent,
                            fontSize: this.cover ? 20.0 : 10.0,
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
      viewportFraction: viewportFraction,
      aspectRatio: aspectRatio,
      autoPlay: autoPlay,
      distortion: distortion
    );
  }
}