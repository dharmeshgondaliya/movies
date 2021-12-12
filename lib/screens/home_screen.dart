import 'package:flutter/material.dart';
import 'package:movies/utils/flags.dart';
import 'package:movies/widgets/home_screen_lable.dart';
import 'package:movies/widgets/movies_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                const HomeLable(title: Flags.nowplaying),
                const SizedBox(height: 20),
                MoviesList(movie: Flags.nowplaying),
                // const SizedBox(height: 30),
                // const HomeLable(title: Flags.popular),
                // const SizedBox(height: 20),
                // MoviesList(movie: Flags.popular),
                // const SizedBox(height: 30),
                // const HomeLable(title: Flags.toprated),
                // const SizedBox(height: 20),
                // MoviesList(movie: Flags.toprated),
                // const SizedBox(height: 30),
                // const HomeLable(title: Flags.upcoming),
                // const SizedBox(height: 20),
                // MoviesList(movie: Flags.upcoming),
                // const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
