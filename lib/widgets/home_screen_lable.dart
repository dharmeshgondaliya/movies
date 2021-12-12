import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeLable extends StatelessWidget {
  const HomeLable({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
