import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class FlixTrailer extends StatelessWidget {
  final item;
  final String videoImage;

  FlixTrailer({Key key, this.item, this.videoImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _youtubeKey = "AIzaSyBCfP7rIsyrywYhfuRJ4KUIDweeH7mbkSI";

    return Expanded(
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5.0),
            height: 150.0,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new NetworkImage(videoImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
                shadows: <Shadow>[
                  Shadow(
                    blurRadius: 3.0,
                    color: Colors.white,
                  ),
                  Shadow(
                    blurRadius: 8.0,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          new Positioned(
            bottom: -20.0,
            right: 0.0,
            child: MaterialButton(
              padding: EdgeInsets.all(0.0),
              onPressed: () {
                FlutterYoutube.playYoutubeVideoById(
                    apiKey: _youtubeKey,
                    videoId: item.key,
                    fullScreen: true //default false
                    );
              },
              child: Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: TriClipper(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 290 / 2 + 15,
                      color: Colors.amber.withOpacity(0.9),
                    ),
                  ),
                  Positioned(
                    top: 290 / 8,
                    right: MediaQuery.of(context).size.width / 12,
                    child: Center(
                        child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 50.0,
                    )),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TriClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(size.width / 2, size.height / 3);
    path.lineTo(size.width, size.height / 1.3);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width / 2, size.height / 3);
    path.lineTo(size.width / 2, size.height / 3);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}