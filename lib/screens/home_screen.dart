import 'package:flutter/material.dart';
import 'package:movies/utils/flags.dart';
import 'package:movies/utils/routes.dart';
import 'package:movies/widgets/drawer_screen.dart';
import 'package:movies/widgets/home_screen_lable.dart';
import 'package:movies/widgets/movies_list.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  late StateSetter discoverSet;
  late StateSetter stateSetter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Movies",
          style: TextStyle(fontFamily: "museo700"),
        ),
      ),
      drawer: DrawerScreen(
        callback: () => stateSetter(() {}),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: StatefulBuilder(builder: (context, state) {
            stateSetter = state;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  if (Flags.showNowPlaying)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HomeLable(title: Flags.nowplaying),
                        const SizedBox(height: 20),
                        MoviesList(movie: Flags.nowplaying),
                        const SizedBox(height: 30),
                      ],
                    ),
                  if (Flags.showPopular)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HomeLable(title: Flags.popular),
                        const SizedBox(height: 20),
                        MoviesList(movie: Flags.popular),
                        const SizedBox(height: 30),
                      ],
                    ),
                  if (Flags.showTopRated)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HomeLable(title: Flags.toprated),
                        const SizedBox(height: 20),
                        MoviesList(movie: Flags.toprated),
                        const SizedBox(height: 30),
                      ],
                    ),
                  if (Flags.showUpComing)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HomeLable(title: Flags.upcoming),
                        const SizedBox(height: 20),
                        MoviesList(movie: Flags.upcoming),
                        const SizedBox(height: 30),
                      ],
                    ),
                  if (Flags.showDiscover)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
            );
          }),
        ),
      ),
    );
  }
}
