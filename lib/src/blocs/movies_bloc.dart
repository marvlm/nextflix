import 'package:rxdart/rxdart.dart';
import 'package:nextflix_test1/src/resources/repository.dart';
import 'package:nextflix_test1/src/models/movie_model.dart';

class MoviesBloc {
  final _repository = Repository();
  final _nowPlayingMovies = PublishSubject<Movie>();
  final _popularMovies = PublishSubject<Movie>();
  final _upcomingMovies = PublishSubject<Movie>();

  Observable<Movie> get allMovies => _nowPlayingMovies.stream;

  Observable<Movie> get popularMovies => _popularMovies.stream;

  Observable<Movie> get upcomingMovies => _upcomingMovies.stream;

  fetchNowPlayingMovies() async {
    Movie movie = await _repository.fetchNowPlayingMovies();
    _nowPlayingMovies.sink.add(movie);
  }

  fetchPopularMovies() async {
    Movie movie = await _repository.fetchPopularMovies();
    _popularMovies.sink.add(movie);
  }

  fetchUpcomingMovies() async {
    Movie movie = await _repository.fetchUpcomingMovies();
    _upcomingMovies.sink.add(movie);
  }

  dispose() {
    _nowPlayingMovies.close();
    _popularMovies.close();
    _upcomingMovies.close();
  }
}

final moviesBloc = MoviesBloc();