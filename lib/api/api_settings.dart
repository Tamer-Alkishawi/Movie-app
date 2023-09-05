class ApiSettings {
  static int page = 1;
  static const String trendingApi =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=acc3db372696c9b43d35526c3ae65c0b';
  static const String topRatedApi =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=acc3db372696c9b43d35526c3ae65c0b';
  static  String actionApi =
      'https://api.themoviedb.org/3/discover/movie?api_key=acc3db372696c9b43d35526c3ae65c0b&with_genres=28?_limit=20&_page=$page';
  static const String thrillerApi =
      'https://api.themoviedb.org/3/discover/movie?api_key=acc3db372696c9b43d35526c3ae65c0b&with_genres=53';
  static const String imagePath = 'https://image.tmdb.org/t/p/w500';
}
