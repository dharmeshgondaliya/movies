import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies/utils/api_manager.dart';
import 'package:movies/utils/flags.dart';
import 'package:movies/utils/url_manager.dart';
import 'package:movies/widgets/cast_and_crew_list.dart';
import 'package:movies/widgets/description_lable.dart';
import 'package:movies/widgets/description_text.dart';
import 'package:movies/widgets/movie_info_shimmer.dart';
import 'package:movies/widgets/video_list.dart';

class Movieinfo extends StatelessWidget {
  Movieinfo({Key? key}) : super(key: key);
  Map moviedata = {};

  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context)!.settings.arguments as String;
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return true;
      },
      child: StreamBuilder(
        stream: ApiManager().getMovie(UrlManager.getMovie(id: int.parse(id))),
        builder: (context, snapshot) {
          if (snapshot.hasData) moviedata = snapshot.data as Map;
          return Scaffold(
            backgroundColor: Flags.background,
            body: moviedata.isEmpty
                ? const MovieInfoShimmer()
                : SafeArea(
                    child: CustomScrollView(
                      slivers: [
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              CachedNetworkImage(
                                imageUrl:
                                    "https://image.tmdb.org/t/p/original/${moviedata['backdrop_path']}",
                                width: double.infinity,
                                errorWidget: (context, str, error) =>
                                    const SizedBox(
                                  height: 190,
                                  width: double.infinity,
                                  child: Center(
                                    child: FlutterLogo(
                                      size: 100,
                                    ),
                                  ),
                                ),
                                progressIndicatorBuilder:
                                    (context, str, progress) => const SizedBox(
                                  width: double.infinity,
                                  height: 190,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: Flags.decorationColor,
                                    ),
                                  ),
                                ),
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          moviedata['title'].toString(),
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if ("${moviedata['vote_average']}"
                                            .isNotEmpty)
                                          Expanded(
                                            child: Column(
                                              children: [
                                                const Text(
                                                  "Vote Average",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontFamily: "capriola",
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Flags
                                                          .descriptionLable),
                                                ),
                                                Text(
                                                  moviedata['vote_average']
                                                      .toString(),
                                                  style: const TextStyle(
                                                    fontFamily: "carme",
                                                    color:
                                                        Flags.descriptiontext,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        if ("${moviedata['release_date']}"
                                            .isNotEmpty)
                                          Expanded(
                                            child: Column(
                                              children: [
                                                const Text(
                                                  "Release Date",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: "capriola",
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        Flags.descriptionLable,
                                                  ),
                                                ),
                                                Text(
                                                  moviedata['release_date']
                                                      .toString(),
                                                  style: const TextStyle(
                                                    fontFamily: "carme",
                                                    color:
                                                        Flags.descriptiontext,
                                                  ),
                                                ),
                                                if ("${moviedata['status']}"
                                                    .isNotEmpty)
                                                  Text(
                                                    "${moviedata['status']}",
                                                    style: const TextStyle(
                                                      fontFamily: "carme",
                                                      color:
                                                          Flags.descriptiontext,
                                                    ),
                                                  )
                                              ],
                                            ),
                                          ),
                                        if ("${moviedata['popularity']}"
                                            .isNotEmpty)
                                          Expanded(
                                            child: Column(
                                              children: [
                                                const Text(
                                                  "Popularity",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontFamily: "capriola",
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Flags
                                                          .descriptionLable),
                                                ),
                                                Text(
                                                  moviedata['popularity']
                                                      .toString(),
                                                  style: const TextStyle(
                                                    fontFamily: "carme",
                                                    color:
                                                        Flags.descriptiontext,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    if (moviedata['genres'] != null &&
                                        moviedata['genres'].isNotEmpty)
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const DescriptionLable(
                                                  lable: "Genre"),
                                              const SizedBox(height: 15),
                                              for (Map m in moviedata['genres'])
                                                DescriptionText(
                                                    text: m['name']),
                                              const SizedBox(height: 30),
                                            ],
                                          ),
                                        ],
                                      ),
                                    if (moviedata['production_companies'] !=
                                            null &&
                                        moviedata['production_companies']
                                            .isNotEmpty)
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const DescriptionLable(
                                                  lable:
                                                      "Production Companies"),
                                              const SizedBox(height: 15),
                                              for (Map m in moviedata[
                                                  'production_companies'])
                                                DescriptionText(
                                                    text: m['name']),
                                              const SizedBox(height: 30),
                                            ],
                                          ),
                                        ],
                                      ),
                                    const SizedBox(height: 20),
                                    if ("${moviedata['overview']}".isNotEmpty)
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const DescriptionLable(
                                              lable: "Description"),
                                          const SizedBox(height: 15),
                                          DescriptionText(
                                              text: "${moviedata['overview']}"),
                                          const SizedBox(height: 30)
                                        ],
                                      ),
                                    if (moviedata['videos']['results'] !=
                                            null &&
                                        moviedata['videos']['results']
                                            .isNotEmpty)
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const DescriptionLable(
                                              lable: "Videos"),
                                          const SizedBox(height: 15),
                                          VideoList(
                                              videos: moviedata['videos']
                                                  ['results']),
                                          const SizedBox(height: 30)
                                        ],
                                      ),
                                    if (moviedata['credits']['cast'] != null &&
                                        moviedata['credits']['cast'].isNotEmpty)
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const DescriptionLable(
                                              lable: "Cast & Crew"),
                                          const SizedBox(height: 15),
                                          CastAndCrewList(
                                              cast: moviedata['credits']
                                                  ['cast']),
                                          const SizedBox(height: 30)
                                        ],
                                      ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
