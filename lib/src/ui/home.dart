import 'package:flutter/material.dart';
import 'package:nextflix_test1/src/ui/carousel.dart';
import 'package:nextflix_test1/src/models/movie_model.dart';
import 'package:nextflix_test1/src/blocs/movies_bloc.dart';
import 'package:nextflix_test1/src/models/tvshow_model.dart';
import 'package:nextflix_test1/src/blocs/tvshows_bloc.dart';

class NextFlixHome extends StatefulWidget {
  NextFlixHome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NextFlixHomeState createState() => new _NextFlixHomeState();
}

class _NextFlixHomeState extends State<NextFlixHome> {
  AsyncSnapshot<TVShow> tvSnapshot;
  AsyncSnapshot<Movie> movieSnapshot;

  @override
  void initState() {
    super.initState();

    moviesBloc.fetchNowPlayingMovies();
    moviesBloc.fetchPopularMovies();
    moviesBloc.fetchUpcomingMovies();
    tvBloc.fetchPopularTVShows();
    tvBloc.fetchTrendingTVShows();
    tvBloc.fetchTopRatedTVShows();
  }

  @override
  void dispose() {
    super.dispose();
    moviesBloc.dispose();
    tvBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget _drawAppBar() {
      return AppBar(
        elevation: 0.0,
        title: Image.asset(
          'images/NextFlix-logo-horizontal.png',
          height: 40.0,
        ),
      );
    }

    Widget _drawTitle(title) {
      return SliverPadding(
        padding: const EdgeInsets.all(8.0),
        sliver: SliverToBoxAdapter(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 14.0, letterSpacing: 2.0),
          ),
        ),
      );
    }

    Widget _drawCarousel(stream, snapshot, cover, isTv) {
      return SliverPadding(
        padding: EdgeInsets.only(left: 3.0, top: 4.0, right: 3.0),
        sliver: SliverToBoxAdapter(
          child: StreamBuilder(
            stream: stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return FlixCarousel(
                  items: snapshot.data.results,
                  cover: cover,
                  isTv: isTv,
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      );
    }

    return Scaffold(
      appBar: _drawAppBar(),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            _drawTitle('EN CARTELERA'),
            _drawCarousel(moviesBloc.allMovies, movieSnapshot, true, false),
            _drawTitle('PELÍCULAS POPULARES'),
            _drawCarousel(
                moviesBloc.popularMovies, movieSnapshot, false, false),
            _drawTitle('PRÓXIMAMENTE'),
            _drawCarousel(
                moviesBloc.upcomingMovies, movieSnapshot, false, false),
            _drawTitle('SERIES DE TV POPULARES'),
            _drawCarousel(tvBloc.popularTVShow, tvSnapshot, false, true),
            _drawTitle('TRENDING EN TV'),
            _drawCarousel(tvBloc.trendingTVShow, tvSnapshot, false, true),
            _drawTitle('SERIES MEJOR VALORADAS'),
            _drawCarousel(tvBloc.topRatedTVShow, tvSnapshot, false, true),
            SliverToBoxAdapter(
              child: SizedBox(height: 10.0),
            )
          ],
        ),
      ),
    );
  }
}