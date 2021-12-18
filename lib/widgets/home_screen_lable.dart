import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies/utils/flags.dart';

class HomeLable extends StatelessWidget {
  const HomeLable({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Flags.descriptionLable,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: "museo700",
      ),
    );
  }
}
