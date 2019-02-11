import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:nextflix_test1/src/models/movie_model.dart';
import 'package:nextflix_test1/src/models/tvshow_model.dart';
import 'package:nextflix_test1/src/models/trailer_model.dart';

class TMDBApiProvider {

  Client client = Client();
  final _apiUrl = 'http://api.themoviedb.org/3';
  final _apiKey = '004cbaf19212094e32aa9ef6f6577f22';  

  Future<Movie> fetchNowPlayingMovieList() async {

    print("Movies Now Playing");
    var requestUrl = "$_apiUrl/movie/now_playing?api_key=$_apiKey";

    final response = await client
        .get(requestUrl);

    print(response.body.toString());

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return Movie.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<Movie> fetchPopularMovieList() async {

    print("Popular Movies");
    var requestUrl = "$_apiUrl/movie/popular?api_key=$_apiKey";

    final response = await client
        .get(requestUrl);

    print(response.body.toString());

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return Movie.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<Movie> fetchUpcomingMovieList() async {

    print("Upcoming Movies");
    var requestUrl = "$_apiUrl/movie/upcoming?api_key=$_apiKey";

    final response = await client
        .get(requestUrl);

    print(response.body.toString());

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return Movie.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<TVShow> fetchPopularTVShows() async {

    print("Popular TV Shows");
    var requestUrl = "$_apiUrl/tv/popular?api_key=$_apiKey";

    final response = await client
        .get(requestUrl);

    print(response.body.toString());

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return TVShow.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<TVShow> fetchTrendingTVShows() async {

    print("Trending TV Shows");
    var requestUrl = "$_apiUrl/trending/tv/week?api_key=$_apiKey";

    final response = await client
        .get(requestUrl);

    print(response.body.toString());

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return TVShow.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<TVShow> fetchTopRatedTVShows() async {

    print("Top Rated TV Shows");
    var requestUrl = "$_apiUrl/tv/top_rated?api_key=$_apiKey";

    final response = await client
        .get(requestUrl);

    print(response.body.toString());

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return TVShow.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<TrailerModel> fetchMovieTrailer(int movieId) async {

    print("Trailers");
    var requestUrl = "$_apiUrl/movie/$movieId/videos?api_key=$_apiKey";

    print(requestUrl);

    final response = await client
        .get(requestUrl);

    if (response.statusCode == 200) {
      return TrailerModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load trailers');
    }
  }
}