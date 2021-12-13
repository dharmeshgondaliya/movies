import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/utils/url_manager.dart';

class ApiManager {
  Stream<List> getMovieList(String url) async* {
    var res = await http.get(Uri.parse(url));
    Map data = json.decode(res.body);
    List movies = data['results'] ?? [];
    if (UrlManager.nowPlaying < 2) yield movies;
  }

  Stream<Map> getMovie(String url) async* {
    var res = await http.get(Uri.parse(url));
    Map data = json.decode(res.body);
    yield data;
  }
}
