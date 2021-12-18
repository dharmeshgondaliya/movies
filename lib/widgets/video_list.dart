import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class VideoList extends StatelessWidget {
  const VideoList({Key? key, required this.videos}) : super(key: key);
  final List videos;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: videos.length,
          itemBuilder: (context, index) {
            return videos[index]['type'].toString() == "Trailer" &&
                    videos[index]['site'].toString() == "YouTube"
                ? Container(
                    height: 100,
                    color: Colors.black45,
                    margin: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {},
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://img.youtube.com/vi/${videos[index]['key']}/default.jpg",
                        height: 100,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  )
                : const SizedBox();
          }),
    );
  }
}
