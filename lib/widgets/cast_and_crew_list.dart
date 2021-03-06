import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies/utils/flags.dart';
import 'package:movies/utils/routes.dart';

class CastAndCrewList extends StatelessWidget {
  const CastAndCrewList({Key? key, required this.cast}) : super(key: key);
  final List cast;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: double.infinity,
        maxWidth: double.infinity,
        minHeight: 250,
        maxHeight: 290,
      ),
      child: ListView.builder(
          itemCount: cast.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            if (cast[index]['profile_path'] == null) return const SizedBox();
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, Routes.actorInfo,
                  arguments: cast[index]['id'].toString()),
              child: Container(
                width: 175,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: const EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: Flags.decorationColor),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://image.tmdb.org/t/p/original${cast[index]['profile_path']}",
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
                    ),
                    const SizedBox(height: 10),
                    Text(
                      cast[index]['name'].toString(),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
