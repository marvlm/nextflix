import 'dart:convert';
import 'package:test_api/test_api.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:nextflix_test1/src/resources/tmdb_api_provider.dart';

void main() {
  final moviesJson = {
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
      }
    ]
  };

  group("Movie list creation test", () {
    test('Get movies now playing', () async {
      final apiProvider = TMDBApiProvider();
      apiProvider.client = MockClient((request) async {
        return Response(json.encode(moviesJson), 200);
      });
      final movies = await apiProvider.fetchNowPlayingMovieList();
      expect(movies.results[0].id, 450465);
    });

    test('Get popular movies', () async {
      final apiProvider = TMDBApiProvider();
      apiProvider.client = MockClient((request) async {
        return Response(json.encode(moviesJson), 200);
      });
      final movies = await apiProvider.fetchPopularMovieList();
      expect(movies.results[0].originalTitle, 'Glass');
    });

    test('Get upcoming movies', () async {
      final apiProvider = TMDBApiProvider();
      apiProvider.client = MockClient((request) async {
        return Response(json.encode(moviesJson), 200);
      });
      final movies = await apiProvider.fetchUpcomingMovieList();
      expect(movies.results[0].voteCount, 1031);
    });
  });

  group("TV Shows list creation test", () {
    test('Get popular tv shows', () async {
      final apiProvider = TMDBApiProvider();
      apiProvider.client = MockClient((request) async {
        return Response(json.encode(tvsJson), 200);
      });
      final tvshows = await apiProvider.fetchPopularTVShows();
      expect(tvshows.results[0].id, 1396);
    });

    test('Get trending tv shows', () async {
      final apiProvider = TMDBApiProvider();
      apiProvider.client = MockClient((request) async {
        return Response(json.encode(tvsJson), 200);
      });
      final tvshows = await apiProvider.fetchTrendingTVShows();
      expect(tvshows.results[0].name, 'Breaking Bad');
    });

    test('Get top rated tv shows', () async {
      final apiProvider = TMDBApiProvider();
      apiProvider.client = MockClient((request) async {
        return Response(json.encode(tvsJson), 200);
      });
      final tvshows = await apiProvider.fetchTopRatedTVShows();
      expect(tvshows.results[0].originalName, 'Breaking Bad');
    });
    
  });
}
