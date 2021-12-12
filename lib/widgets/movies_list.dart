import 'package:flutter/material.dart';
import 'package:movies/utils/api_manager.dart';
import 'package:movies/utils/flags.dart';
import 'package:movies/utils/url_manager.dart';
import 'package:movies/widgets/home_screen_list_shimmer.dart';
import 'package:movies/widgets/movie.dart';

class MoviesList extends StatelessWidget {
  MoviesList({Key? key, required this.movie}) : super(key: key);
  final String movie;
  List movies = [];
  late StateSetter setter;
  ApiManager apiManager = ApiManager();

  getStreamData() {
    switch (movie) {
      case Flags.nowplaying:
        return apiManager.getMovieList(
            UrlManager.getNowPlaying(page: UrlManager.nowPlaying + 1));
      case Flags.popular:
        return apiManager
            .getMovieList(UrlManager.getPopular(page: UrlManager.popular + 1));
      case Flags.toprated:
        return apiManager.getMovieList(
            UrlManager.getToprated(page: UrlManager.topRated + 1));
      case Flags.upcoming:
        return apiManager.getMovieList(
            UrlManager.getUpcoming(page: UrlManager.upcoming + 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, state) {
        setter = state;
        return StreamBuilder(
          stream: getStreamData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              movies.addAll(snapshot.data as List);
            }
            if (movies.isEmpty) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                child: Row(
                  children:
                      List.generate(5, (index) => const HomeScreenShimmer()),
                ),
              );
            }
            print(movies.length);
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              child: Row(
                children: movies.map((e) => Movie(movie: e)).toList(),
              ),
            );
          },
        );
      },
    );
  }
}