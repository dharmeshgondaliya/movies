import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/utils/routes.dart';

class ActorMovies extends StatelessWidget {
  const ActorMovies({Key? key, required this.movies}) : super(key: key);
  final List movies;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: double.infinity,
        maxWidth: double.infinity,
        minHeight: 250,
        maxHeight: 300,
      ),
      child: ListView.builder(
          itemCount: movies.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            String img = "";
            if (movies[index]['poster_path'] != null) {
              img = movies[index]['poster_path'];
            }
            if (img.isEmpty && movies[index]['backdrop_path'] != null) {
              img = movies[index]['backdrop_path'];
            }
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, Routes.movieInfo,
                  arguments: movies[index]['id'].toString()),
              child: Container(
                width: 175,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: const EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    img.isNotEmpty
                        ? ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://image.tmdb.org/t/p/original$img",
                              fit: BoxFit.contain,
                              errorWidget: (context, str, error) {
                                return const SizedBox(
                                  height: 225,
                                  child: Center(
                                    child: FlutterLogo(),
                                  ),
                                );
                              },
                              progressIndicatorBuilder:
                                  (context, str, progress) {
                                return const SizedBox(
                                  height: 225,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              },
                            ),
                          )
                        : const SizedBox(),
                    const SizedBox(height: 10),
                    Text(
                      movies[index]['title'].toString(),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontFamily: "carme"),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
