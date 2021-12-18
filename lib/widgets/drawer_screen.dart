import 'package:flutter/material.dart';
import 'package:movies/utils/flags.dart';
import 'package:movies/widgets/drawer_switch.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key, required this.callback}) : super(key: key);
  final Function callback;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: const BoxDecoration(color: Colors.white),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          DrawerSwitch(
              lable: Flags.nowplaying,
              value: Flags.showNowPlaying,
              callback: (val) {
                Flags.showNowPlaying = val;
                callback();
              }),
          DrawerSwitch(
              lable: Flags.popular,
              value: Flags.showPopular,
              callback: (val) {
                Flags.showPopular = val;
                callback();
              }),
          DrawerSwitch(
              lable: Flags.toprated,
              value: Flags.showTopRated,
              callback: (val) {
                Flags.showTopRated = val;
                callback();
              }),
          DrawerSwitch(
              lable: Flags.upcoming,
              value: Flags.showUpComing,
              callback: (val) {
                Flags.showUpComing = val;
                callback();
              }),
          DrawerSwitch(
              lable: Flags.discover,
              value: Flags.showDiscover,
              callback: (val) {
                Flags.showDiscover = val;
                callback();
              }),
        ],
      ),
    );
  }
}
