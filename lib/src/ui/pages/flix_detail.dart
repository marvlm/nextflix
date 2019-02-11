import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nextflix_test1/src/blocs/flix_detail_bloc_provider.dart';
import 'package:nextflix_test1/src/models/trailer_model.dart';
import 'package:nextflix_test1/src/ui/widgets/trailer.dart';

class FlixDetail extends StatefulWidget {
  final isTv;
  final dynamic flix;

  FlixDetail({
    this.isTv,
    this.flix,
  });

  @override
  State<StatefulWidget> createState() {
    return FlixDetailState();
  }
}

class FlixDetailState extends State<FlixDetail> {
  FlixDetailBloc bloc;
  var imageUrl = 'https://image.tmdb.org/t/p/w500';  

  @override
  void didChangeDependencies() {
    print('id');
    print(widget.flix.id);
    bloc = FlixDetailBlocProvider.of(context);
    bloc.fetchMovieTrailersById(widget.flix.id);
    
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  Widget _drawPoster() {    

    return SliverAppBar(
      expandedHeight: 190.0,
      floating: false,
      pinned: true,
      elevation: 0.0,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          '$imageUrl${widget.flix.posterPath}',
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  Widget _drawTitle(title) {
    return Padding(
      padding: const EdgeInsets.only(bottom:14.0,),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _drawDateAverageRow() {
    return Row(
      children: <Widget>[
        Icon(
          Icons.favorite,
          color: Colors.red,
        ),
        SizedBox(width: 2.0),
        Text(
          widget.flix.voteAverage.toString(),
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
        SizedBox(width: 20.0),
        Text(
          widget.isTv ? widget.flix.firstAirDate : widget.flix.releaseDate,
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ],
    );
  }

  Widget _drawDescription() {
    return Text(
      widget.flix.overview,
      maxLines: 6,
    );
  }

  Widget _drawTrailer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _drawTitle('Trailer'),
        StreamBuilder(
          stream: bloc.movieTrailers,
          builder: (context, AsyncSnapshot<Future<TrailerModel>> snapshot) {
            if (snapshot.hasData) {
              return FutureBuilder(
                future: snapshot.data,
                builder: (context, AsyncSnapshot<TrailerModel> trailerSnapShot) {
                  if (trailerSnapShot.hasData) {
                    if (trailerSnapShot.data.results.length > 0)
                      return _drawTrailerLayout(trailerSnapShot.data);
                    else
                      return _drawNoTrailer();
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ],
    );
  }

  Widget _drawTrailerLayout(TrailerModel trailer) {
    return Row(
      children: <Widget>[
        FlixTrailer(
          item: trailer.results[0],
          videoImage: '$imageUrl${widget.flix.backdropPath}',
        ),
      ],
    );
  }

  Widget _drawNoTrailer() {
    return Center(
      child: Container(
        child: Text("No trailer available"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    var title = widget.isTv ? widget.flix.name : widget.flix.title;

    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              _drawPoster(),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _drawTitle(title),
                _drawDateAverageRow(),
                SizedBox(height: 14.0),
                _drawDescription(),
                SizedBox(height: 14.0),
                _drawTrailer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}