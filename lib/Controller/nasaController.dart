import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Modal/nasaModal.dart';

class Nasacontroller extends ChangeNotifier {
  bool isLike = false;
  List<String> likeData = [];

  void Like() {
    isLike = !isLike;
    notifyListeners();
  }

  Future<void> addLikeData({required NasaModal nasaModal}) async {
    likeData.add(nasaModal.camera.name);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('name', nasaModal.camera.name);

    notifyListeners();
  }

  Future<void> removeLikedata({
    required String name,
  }) async {
    likeData.clear();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(name);

    notifyListeners();
  }
}
