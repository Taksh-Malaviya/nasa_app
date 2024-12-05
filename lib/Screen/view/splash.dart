import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nasa_app/Routes/routes.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 8),
      () {
        Navigator.pushReplacementNamed(context, Routes.home);
      },
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.network(
            "https://media.giphy.com/media/113mtXIRqf3jfW/giphy.gif"),
      ),
    );
  }
}
