import 'package:movies/screens/discover_filter_screen.dart';
import 'package:movies/utils/data_manager.dart';

class UrlManager {
  static const String key = "2d94916a239292073cfd32487348c9dc";
  static int nowPlaying = 0;
  static int popular = 0;
  static int topRated = 0;
  static int upcoming = 0;
  static int discover = 0;

  static String getDiscover({required int page}) {
    discover = page;
    String url = "";
    if (DiscoverFilter.name.text.isNotEmpty) {
      url =
          "https://api.themoviedb.org/3/search/company?api_key=${UrlManager.key}&query=${DiscoverFilter.name.text}&page=1";
    } else {
      url =
          "https://api.themoviedb.org/3/discover/movie?api_key=${UrlManager.key}&language=en-US&sort_by=popularity.desc&include_adult=${DiscoverFilter.includeAdult}&include_video=false&page=$discover&with_watch_monetization_types=flatrate";
      if (DataManager.languages.first['iso_639_1'] != DiscoverFilter.language) {
        url += "&with_original_language=${DiscoverFilter.language}";
      }
      if (DataManager.genres.first['id'] != DiscoverFilter.genre) {
        url += "&with_genres=${DiscoverFilter.genre}";
      }
      if (DataManager.regions.first['iso_3166_1'] != DiscoverFilter.region) {
        url += "&region=${DiscoverFilter.region}";
      }
    }
    return url;
  }

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

  static String getMovie({required int id}) {
    return "https://api.themoviedb.org/3/movie/$id?api_key=${UrlManager.key}&language=en-US&append_to_response=videos,credits";
  }

  static String getPerson({required int id}) {
    return "https://api.themoviedb.org/3/person/$id?api_key=${UrlManager.key}&language=en-US&append_to_response=external_ids,movie_credits";
  }
}
