import 'dart:convert';
import 'package:test_api/test_api.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:nextflix_test1/src/resources/tmdb_api_provider.dart';

void main() {
  test('Testing the network call', () async {
    final apiProvider = TMDBApiProvider();
    apiProvider.client = MockClient((request) async {
      final mapJson = {
        "results": [
          {
            "vote_count": 1031,
            "id": 450465,
            "video": false,
            "vote_average": 6.9,
            "title": "Glass",
            "popularity": 427.352,
            "poster_path": "\/svIDTNUoajS8dLEo7EosxvyAsgJ.jpg",
            "original_language": "en",
            "original_title": "Glass",
            "genre_ids": [53, 9648, 18],
            "backdrop_path": "\/lvjscO8wmpEbIfOEZi92Je8Ktlg.jpg",
            "adult": false,
            "overview":
                "In a series of escalating encounters, security guard David Dunn uses his supernatural abilities to track Kevin Wendell Crumb, a disturbed man who has twenty-four personalities. Meanwhile, the shadowy presence of Elijah Price emerges as an orchestrator who holds secrets critical to both men.",
            "release_date": "2019-01-16"
          }
        ]
      };
      return Response(json.encode(mapJson), 200);
    });
    final item = await apiProvider.fetchNowPlayingMovieList();
    expect(item.results[0].id, 450465);
  });
}