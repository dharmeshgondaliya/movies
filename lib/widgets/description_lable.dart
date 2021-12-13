import 'package:flutter/cupertino.dart';
import 'package:movies/utils/flags.dart';

class DescriptionLable extends StatelessWidget {
  const DescriptionLable({Key? key, required this.lable}) : super(key: key);
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Text(
      lable,
      style: const TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w500,
        color: Flags.descriptionLable,
      ),
    );
  }
}
