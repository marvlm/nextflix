import 'dart:async';
import 'package:nextflix_test1/src/resources/tmdb_api_provider.dart';
import 'package:nextflix_test1/src/models/movie_model.dart';
import 'package:nextflix_test1/src/models/tvshow_model.dart';
import 'package:nextflix_test1/src/models/trailer_model.dart';

class Repository {
  final tmdbApiProvider = TMDBApiProvider();

  Future<Movie> fetchNowPlayingMovies() => tmdbApiProvider.fetchNowPlayingMovieList();

  Future<Movie> fetchPopularMovies() => tmdbApiProvider.fetchPopularMovieList();

  Future<Movie> fetchUpcomingMovies() => tmdbApiProvider.fetchUpcomingMovieList();

  Future<TVShow> fetchPopularTVShows() => tmdbApiProvider.fetchPopularTVShows();

  Future<TVShow> fetchTrendingTVShows() => tmdbApiProvider.fetchTrendingTVShows();

  Future<TVShow> fetchTopRatedTVShows() => tmdbApiProvider.fetchTopRatedTVShows();

  Future<TrailerModel> fetchMovieTrailers(int movieId) => tmdbApiProvider.fetchMovieTrailer(movieId);

}