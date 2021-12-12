import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Movie extends StatelessWidget {
  const Movie({Key? key, required this.movie}) : super(key: key);
  final Map movie;
  @override
  Widget build(BuildContext context) {
    String img = "";
    img = movie['poster_path'];
    if (img.isEmpty) {
      img = movie['backdrop_path'];
    }
    return Container(
      width: 175,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          img.isNotEmpty
              ? ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
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
            movie['title'].toString(),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
