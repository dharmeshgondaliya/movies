import 'package:flutter/material.dart';
import 'package:movies/utils/routes.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Movies",
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homeScreen,
      routes: Routes.routes,
    ),
  );
}
