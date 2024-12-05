import 'package:flutter/material.dart';
import 'package:nasa_app/Myapp.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences preferences = await SharedPreferences.getInstance();

  runApp(
    Myapp(),
  );
}
