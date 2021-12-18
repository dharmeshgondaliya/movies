import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies/utils/flags.dart';
import 'package:movies/utils/routes.dart';

class Movie extends StatelessWidget {
  const Movie({Key? key, required this.movie}) : super(key: key);
  final Map movie;
  @override
  Widget build(BuildContext context) {
    String img = "";
    img = movie['poster_path'];
    if (img.isEmpty || img == null) {
      img = movie['backdrop_path'];
    }
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, Routes.movieInfo,
          arguments: movie['id'].toString()),
      child: Container(
        width: 175,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Flags.decorationColor),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            img.isNotEmpty
                ? ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: CachedNetworkImage(
                      imageUrl: "https://image.tmdb.org/t/p/original$img",
                      fit: BoxFit.contain,
                      errorWidget: (context, str, error) {
                        return const SizedBox(
                          height: 225,
                          child: Center(
                            child: FlutterLogo(),
                          ),
                        );
                      },
                      progressIndicatorBuilder: (context, str, progress) {
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
              movie['title'].toString(),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontFamily: "carme"),
            ),
          ],
        ),
      ),
    );
  }
}
