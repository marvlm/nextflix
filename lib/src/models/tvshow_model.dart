class TVShow {

  int _page;
  int _totalResults;
  int _totalPages;
  List<_Result> _results = [];

  TVShow.fromJson(Map<String, dynamic> parsedJson) {

    print(parsedJson['results'].length);

    _page = parsedJson['page'];

    _totalResults = parsedJson['total_results'];

    _totalPages = parsedJson['total_pages'];

    List<_Result> temp = [];

    for (int i = 0; i < parsedJson['results'].length; i++) {
      _Result result = _Result(parsedJson['results'][i]);
      temp.add(result);
    }

    _results = temp;
  }

  List<_Result> get results => _results;

  int get totalPages => _totalPages;

  int get totalResults => _totalResults;

  int get page => _page;
}

class _Result {
  
  String _originalName;  
  List<int> _genreIds = [];
  String _name;
  double _popularity;
  List<String> _originCountry = [];
  int _voteCount;
  String _firstAirDate;
  String _backdropPath;
  String _originalLanguage;
  int _id;
  var _voteAverage;    
  String _overview; 
  String _posterPath;

  _Result(result) {
    _originalName = result['original_name'];
    for (int i = 0; i < result['genre_ids'].length; i++) {
      _genreIds.add(result['genre_ids'][i]);
    }
    _name = result['name'];
    _popularity = result['popularity'];
    for (int i = 0; i < result['origin_country'].length; i++) {
      _originCountry.add(result['origin_country'][i]);
    }
    _voteCount = result['vote_count'];
    _firstAirDate = result['first_air_date'];
    _backdropPath = result['backdrop_path'];
    _originalLanguage = result['original_language'];
    _id = result['id'];
    _voteAverage = result['vote_average']; 
    _overview = result['overview'];          
    _posterPath = result['poster_path'];         
  }

  String get originalName => _originalName;

  List<int> get genreIds => _genreIds;
  
  String get name => _name;

  double get popularity => _popularity;
  
  List<String> get originCountry => _originCountry;

  int get voteCount => _voteCount;

  String get firstAirDate => _firstAirDate;

  String get backdropPath => _backdropPath;  

  String get originalLanguage => _originalLanguage;

  int get id => _id;

  double get voteAverage => _voteAverage;

  String get overview => _overview;

  String get posterPath => _posterPath;    

}