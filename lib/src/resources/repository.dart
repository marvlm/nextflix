import 'dart:async';
import 'package:nextflix_test1/src/resources/tmdb_api_provider.dart';
import 'package:nextflix_test1/src/models/movie_model.dart';
import 'package:nextflix_test1/src/models/tvshow_model.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<Movie> fetchNowPlayingMovies() => moviesApiProvider.fetchNowPlayingMovieList();

  Future<Movie> fetchPopularMovies() => moviesApiProvider.fetchPopularMovieList();

  Future<Movie> fetchUpcomingMovies() => moviesApiProvider.fetchUpcomingMovieList();

  Future<TVShow> fetchPopularTVShows() => moviesApiProvider.fetchPopularTVShows();

  Future<TVShow> fetchTrendingTVShows() => moviesApiProvider.fetchTrendingTVShows();

  Future<TVShow> fetchTopRatedTVShows() => moviesApiProvider.fetchTopRatedTVShows();

}