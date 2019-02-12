// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nextflix_test1/src/app.dart';
import 'package:nextflix_test1/src/ui/widgets/carousel.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:nextflix_test1/src/resources/tmdb_api_provider.dart';
import 'package:nextflix_test1/src/resources/config.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  Config config = new Config();
  final tvsJson = {
    "results": [
      {
        "original_name": "Breaking Bad",
        "genre_ids": [18],
        "name": "Breaking Bad",
        "popularity": 88.59,
        "origin_country": ["US"],
        "vote_count": 3076,
        "first_air_date": "2008-01-20",
        "backdrop_path": "/eSzpy96DwBujGFj0xMbXBcGcfxX.jpg",
        "original_language": "en",
        "id": 1396,
        "vote_average": 8.4,
        "overview":
            "When Walter White, a New Mexico chemistry teacher, is diagnosed with Stage III cancer and given a prognosis of only two years left to live. He becomes filled with a sense of fearlessness and an unrelenting desire to secure his family's financial future at any cost as he enters the dangerous world of drugs and crime.",
        "poster_path": "/1yeVJox3rjo2jBKrrihIMj7uoS9.jpg"
      },
      {
        "original_name": "Stranger Things",
        "genre_ids": [18, 9648, 10765],
        "name": "Stranger Things",
        "popularity": 50.399,
        "origin_country": ["US"],
        "vote_count": 2075,
        "first_air_date": "2016-07-15",
        "backdrop_path": "/56v2KjBlU4XaOv9rVYEQypROD7P.jpg",
        "original_language": "en",
        "id": 66732,
        "vote_average": 8.3,
        "overview":
            "When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.",
        "poster_path": "/vNJ95BMCzIBJZhW0IEoxzOoW53P.jpg"
      }
    ]
  };
  testWidgets('Detail page navigation smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(NextFlix());

    // Verify that our counter starts at 0.
    expect(find.text('EN CARTELERA'), findsOneWidget);
    expect(find.text('TRAILER'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('TRAILER'), findsNothing);
    expect(find.text('EN CARTELERA'), findsOneWidget);
  });

  testWidgets('Verify TV Show Carousel generation',
      (WidgetTester tester) async {
    final apiProvider = TMDBApiProvider();
    apiProvider.client = MockClient((request) async {
      return Response(json.encode(tvsJson), 200);
    });
    final tvshows = await apiProvider.fetchPopularTVShows();

    await tester.pumpWidget(FlixCarousel(
      items: tvshows.results,
      cover: false,
      isTv: true,
    ));

    print('${config.imageUrl}${tvshows.results[0].posterPath}');

    expect(find.widgetWithText(CarouselSlider, '${tvshows.results[1].name}'), findsOneWidget);

    /* expect(
        find.byWidget(
          Image.network(
            '${config.imageUrl}${tvshows.results[0].posterPath}',
            fit: BoxFit.contain,
            width: 1000.0,
          ),
        ),
        findsOneWidget); */

  });
}
