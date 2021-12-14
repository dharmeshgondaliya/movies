import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ActorMovies extends StatelessWidget {
  ActorMovies({Key? key, required this.movies}) : super(key: key);
  List movies;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: movies.map((e) {
          String img = "";
          if (e['poster_path'] != null) {
            img = e['poster_path'];
          }
          if (img.isEmpty && e['backdrop_path'] != null) {
            img = e['backdrop_path'];
          }
          return GestureDetector(
            child: Container(
              width: 175,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                            imageUrl: "https://image.tmdb.org/t/p/original$img",
                            fit: BoxFit.contain,
                            errorWidget: (context, str, error) {
                              return const SizedBox(
                                height: 250,
                                child: Center(
                                  child: FlutterLogo(),
                                ),
                              );
                            },
                            progressIndicatorBuilder: (context, str, progress) {
                              return const SizedBox(
                                height: 250,
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
                    e['title'].toString(),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontFamily: "carme"),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
