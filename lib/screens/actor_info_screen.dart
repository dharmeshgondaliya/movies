import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/utils/api_manager.dart';
import 'package:movies/utils/flags.dart';
import 'package:movies/utils/url_manager.dart';
import 'package:movies/widgets/actor_movies.dart';
import 'package:movies/widgets/description_lable.dart';
import 'package:movies/widgets/description_text.dart';
import 'package:movies/widgets/movie_info_shimmer.dart';

class Actorinfo extends StatelessWidget {
  Actorinfo({Key? key}) : super(key: key);

  Map actor = {};

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return true;
      },
      child: StreamBuilder(
        stream: ApiManager().getMovie(UrlManager.getPerson(id: 2)),
        builder: (context, snapshot) {
          if (snapshot.hasData) actor = snapshot.data as Map;
          return Scaffold(
            backgroundColor: Flags.background,
            body: actor.isEmpty
                ? const MovieInfoShimmer()
                : SafeArea(
                    child: CustomScrollView(
                      slivers: [
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              CachedNetworkImage(
                                imageUrl:
                                    "https://image.tmdb.org/t/p/original${actor['profile_path']}",
                                fit: BoxFit.fitWidth,
                                errorWidget: (context, str, error) =>
                                    const SizedBox(
                                  width: double.infinity,
                                  height: 250,
                                  child: Center(
                                    child: FlutterLogo(
                                      size: 150,
                                    ),
                                  ),
                                ),
                                progressIndicatorBuilder:
                                    (context, str, progress) => const SizedBox(
                                  width: double.infinity,
                                  height: 500,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: Flags.decorationColor,
                                    ),
                                  ),
                                ),
                                width: double.infinity,
                              ),
                              const SizedBox(height: 30),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          actor['name'],
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontFamily: "museo700",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 30),
                                    Row(
                                      children: [
                                        if (actor['birthday'] != null)
                                          Column(
                                            children: [
                                              const Text(
                                                "Birthday",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: "capriola"),
                                              ),
                                              Text(
                                                actor['birthday'],
                                                style: const TextStyle(
                                                  fontFamily: "carme",
                                                  fontSize: 15,
                                                ),
                                              )
                                            ],
                                          ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: Image.asset(
                                                  "asset/image/instagram.png",
                                                  width: 30,
                                                  height: 30,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: Image.asset(
                                                  "asset/image/facebook.png",
                                                  width: 30,
                                                  height: 30,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: Image.asset(
                                                  "asset/image/twitter.png",
                                                  width: 30,
                                                  height: 30,
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    if (actor['biography'] != null)
                                      Column(
                                        children: [
                                          const DescriptionLable(
                                              lable: "Biography"),
                                          const SizedBox(height: 15),
                                          DescriptionText(
                                              text: actor['biography']),
                                          const SizedBox(height: 30),
                                        ],
                                      ),
                                    if (actor['movie_credits']['cast'] !=
                                            null &&
                                        actor['movie_credits']['cast']
                                            .isNotEmpty)
                                      ActorMovies(
                                          movies: actor['movie_credits']
                                              ['cast']),
                                    const SizedBox(height: 20)
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
