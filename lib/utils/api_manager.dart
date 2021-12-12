import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiManager {
  Stream<List> getMovieList(String url) async* {
    var res = await http.get(Uri.parse(url));
    Map data = json.decode(res.body);
    List movies = data['results'] ?? [];
    yield movies;
  }
}
