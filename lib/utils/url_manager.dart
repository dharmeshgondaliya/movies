class UrlManager {
  static const String key = "2d94916a239292073cfd32487348c9dc";
  static int nowPlaying = 0;
  static int popular = 0;
  static int topRated = 0;
  static int upcoming = 0;

  static String getNowPlaying({required int page}) {
    nowPlaying = page;
    return "https://api.themoviedb.org/3/movie/now_playing?api_key=${UrlManager.key}&language=en-US&page=$nowPlaying";
  }

  static String getPopular({required int page}) {
    popular = page;
    return "https://api.themoviedb.org/3/movie/popular?api_key=${UrlManager.key}&language=en-US&page=$nowPlaying";
  }

  static String getToprated({required int page}) {
    topRated = page;
    return "https://api.themoviedb.org/3/movie/top_rated?api_key=${UrlManager.key}&language=en-US&page=$nowPlaying";
  }

  static String getUpcoming({required int page}) {
    upcoming = page;
    return "https://api.themoviedb.org/3/movie/upcoming?api_key=${UrlManager.key}&language=en-US&page=$nowPlaying";
  }
}
