import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:nextflix_test1/src/ui/pages/flix_detail.dart';
import 'package:nextflix_test1/src/blocs/flix_detail_bloc_provider.dart';
import 'package:nextflix_test1/src/resources/config.dart';

class FlixCarousel extends StatelessWidget {
  FlixCarousel({Key key, this.items, this.cover, this.isTv}) : super(key: key);

  final List items;
  final bool cover, isTv;

  @override
  Widget build(BuildContext context) {

    Config config = Config();

    _openDetailPage(flix) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return FlixDetailBlocProvider(
            child: FlixDetail(
              isTv: isTv,
              flix: flix,
            ),
          );
        }),
      );
    }

    return CarouselSlider(
      items: items.map(
        (i) {
          return new Builder(
            builder: (BuildContext context) {
              return Card(
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  children: <Widget>[
                    InkResponse(
                      enableFeedback: true,
                      onTap: () => _openDetailPage(i),
                      child: Image.network(
                        this.cover
                            ? '${config.imageUrl}${i.backdropPath}'
                            : '${config.imageUrl}${i.posterPath}',
                        fit: this.cover ? BoxFit.cover : BoxFit.contain,
                        width: 1000.0,
                      ),
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
      enlargeCenterPage: this.cover ? true : false,
    );
  }
}
