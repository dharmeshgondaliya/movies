import 'package:flutter/cupertino.dart';
import 'package:movies/utils/flags.dart';

class DescriptionText extends StatelessWidget {
  const DescriptionText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 17,
          fontFamily: "carme",
          fontWeight: FontWeight.w500,
          color: Flags.descriptiontext),
    );
  }
}
