import 'package:movies/screens/home_screen.dart';
import 'package:movies/screens/movie_info_screen.dart';
import 'package:movies/screens/splash_screen.dart';

class Routes {
  static const String splashScreen = "splashscreen";
  static const String homeScreen = "homeScreen";
  static const String movieInfo = "movieInfo";
  static final routes = {
    Routes.splashScreen: (context) => const SplashScreen(),
    Routes.homeScreen: (context) => const HomeScreen(),
    Routes.movieInfo: (context) => Movieinfo(),
  };
}
