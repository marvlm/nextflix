import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FlixCarousel extends StatelessWidget {
  FlixCarousel(
      {Key key,
      this.items,
      this.cover,
      this.isTv})
      : super(key: key);

  final List items;
  final bool cover, isTv;

  @override
  Widget build(BuildContext context) {
    var imageUrl = 'https://image.tmdb.org/t/p/w500';

    return CarouselSlider(
      items: items.map(
        (i) {
          return new Builder(
            builder: (BuildContext context) {
              return Card(
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      this.cover
                          ? '$imageUrl${i.backdropPath}'
                          : '$imageUrl${i.posterPath}',
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
                          this.isTv ? '${i.name}' : '${i.title}',
                          style: TextStyle(
                            color:
                                this.cover ? Colors.white : Colors.transparent,
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
      viewportFraction: this.cover ? 0.9 : 0.35,
      aspectRatio: this.cover ? 2.0 : 1.9,
      autoPlay: this.cover ? true : false,
      distortion: this.cover ? true : false,
    );
  }
}
