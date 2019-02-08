class Movie {

  int _page;
  int _totalResults;
  int _totalPages;
  List<_Result> _results = [];

  Movie.fromJson(Map<String, dynamic> parsedJson) {

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
  
  double _popularity;
  int _voteCount;  
  bool _video;
  String _posterPath;
  int _id;
  bool _adult;
  String _backdropPath; 
  String _originalLanguage; 
  String _originalTitle;
  List<int> _genreIds = [];
  String _title; 
  var _voteAverage;         
  String _overview;
  String _releaseDate;

  _Result(result) {
    _popularity = result['popularity'].toDouble();
    _voteCount = result['vote_count'];
    _video = result['video'];
    _posterPath = result['poster_path'];
    _id = result['id'];   
    _adult = result['adult']; 
    _backdropPath = result['backdrop_path']; 
    _originalLanguage = result['original_language'];
    _originalTitle = result['original_title'];
    for (int i = 0; i < result['genre_ids'].length; i++) {
      _genreIds.add(result['genre_ids'][i]);
    }   
    _title = result['title'];   
    _voteAverage = result['vote_average'].toDouble();                         
    _overview = result['overview'];
    _releaseDate = result['release_date'];
  }

  double get popularity => _popularity;

  int get voteCount => _voteCount;

  bool get video => _video;

  String get posterPath => _posterPath;

  int get id => _id;

  bool get adult => _adult;

  String get backdropPath => _backdropPath;

  String get originalLanguage => _originalLanguage; 

  String get originalTitle => _originalTitle;

  List<int> get genreIds => _genreIds;

  String get releaseDate => _releaseDate;

  double get voteAverage => _voteAverage;  

  String get overview => _overview;       

  String get title => _title;    
  
}