import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies/utils/routes.dart';

class CastAndCrewList extends StatelessWidget {
  const CastAndCrewList({Key? key, required this.cast}) : super(key: key);
  final List cast;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: cast.map((e) {
          if (e['profile_path'] == null) return const SizedBox();
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, Routes.actorInfo),
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
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://image.tmdb.org/t/p/original${e['profile_path']}",
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
                          height: 250,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    e['name'].toString(),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
