import 'package:flutter/material.dart';
import 'package:nasa_app/Screen/view/detail.dart';
import 'package:nasa_app/Screen/view/fav.dart';
import 'package:nasa_app/Screen/view/home.dart';

import '../Screen/view/splash.dart';

class Routes {
  static const String splash = '/';
  static const String home = 'home';
  static const String detail = 'detail';
  static const String fav = 'fav';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const Splash(),
    home: (context) => const Home(),
    detail: (context) => const Detail(),
    fav: (context) => const Fav(),
  };
}
