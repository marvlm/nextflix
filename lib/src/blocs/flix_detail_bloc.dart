import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:nextflix_test1/src/models/trailer_model.dart';
import 'package:nextflix_test1/src/resources/repository.dart';

class FlixDetailBloc {
  final _repository = Repository();
  final _movieId = PublishSubject<int>();
  final _trailers = BehaviorSubject<Future<TrailerModel>>();

  Function(int) get fetchMovieTrailersById => _movieId.sink.add;
  Observable<Future<TrailerModel>> get movieTrailers => _trailers.stream;

  FlixDetailBloc() {
    _movieId.stream.transform(_itemTransformer()).pipe(_trailers);
  }

  dispose() async {
    _movieId.close();
    await _trailers.drain();
    _trailers.close();
  }

  _itemTransformer() {
    return ScanStreamTransformer(
      (Future<TrailerModel> trailer, int id, int index) {
        print(index);
        trailer = _repository.fetchMovieTrailers(id);
        return trailer;
      },
    );
  }
}