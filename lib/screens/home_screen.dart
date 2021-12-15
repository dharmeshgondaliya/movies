import 'package:flutter/material.dart';
import 'package:movies/utils/flags.dart';
import 'package:movies/utils/routes.dart';
import 'package:movies/widgets/home_screen_lable.dart';
import 'package:movies/widgets/movies_list.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  late StateSetter discoverSet;
  bool showNowPlaying = false;
  bool showPopular = false;
  bool showTopRated = false;
  bool showUpcoming = false;
  bool showDiscover = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const SizedBox(height: 20),
                if (showNowPlaying)
                  Column(
                    children: [
                      const HomeLable(title: Flags.nowplaying),
                      const SizedBox(height: 20),
                      MoviesList(movie: Flags.nowplaying),
                      const SizedBox(height: 30),
                    ],
                  ),
                if (showPopular)
                  Column(
                    children: [
                      const HomeLable(title: Flags.popular),
                      const SizedBox(height: 20),
                      MoviesList(movie: Flags.popular),
                      const SizedBox(height: 30),
                    ],
                  ),
                if (showTopRated)
                  Column(
                    children: [
                      const HomeLable(title: Flags.toprated),
                      const SizedBox(height: 20),
                      MoviesList(movie: Flags.toprated),
                      const SizedBox(height: 30),
                    ],
                  ),
                if (showUpcoming)
                  Column(
                    children: [
                      const HomeLable(title: Flags.upcoming),
                      const SizedBox(height: 20),
                      MoviesList(movie: Flags.upcoming),
                      const SizedBox(height: 30),
                    ],
                  ),
                if (showDiscover)
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const HomeLable(title: Flags.discover),
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                      context, Routes.discoverFilter)
                                  .then((value) {
                                if (value as bool) {
                                  discoverSet(() {});
                                }
                              });
                            },
                            icon: const Icon(Icons.filter_alt_sharp),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      StatefulBuilder(builder: (context, state) {
                        discoverSet = state;
                        return MoviesList(movie: Flags.discover);
                      }),
                      const SizedBox(height: 30)
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
