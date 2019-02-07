import 'package:rxdart/rxdart.dart';
import 'package:nextflix_test1/src/resources/repository.dart';
import 'package:nextflix_test1/src/models/tvshow_model.dart';

class TVShowsBloc {
  final _repository = Repository();
  final _popularTVFetcher = PublishSubject<TVShow>();
  final _trendingTVFetcher = PublishSubject<TVShow>();
  final _topRatedTVFetcher = PublishSubject<TVShow>();

  Observable<TVShow> get popularTVShow => _popularTVFetcher.stream;

  Observable<TVShow> get trendingTVShow => _trendingTVFetcher.stream;

  Observable<TVShow> get topRatedTVShow => _topRatedTVFetcher.stream;

  fetchPopularTVShows() async {
    TVShow tvshow = await _repository.fetchPopularTVShows();
    _trendingTVFetcher.sink.add(tvshow);
  }

  fetchTrendingTVShows() async {
    TVShow tvshow = await _repository.fetchTrendingTVShows();
    _popularTVFetcher.sink.add(tvshow);
  }

  fetchTopRatedTVShows() async {
    TVShow tvshow = await _repository.fetchTopRatedTVShows();
    _topRatedTVFetcher.sink.add(tvshow);
  }

  dispose() {
    _popularTVFetcher.close();
    _trendingTVFetcher.close();
    _topRatedTVFetcher.close();
  }
}

final tvBloc = TVShowsBloc();