import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Modal/nasaModal.dart';

class APIHelper {
  APIHelper._();

  static APIHelper apiHelper = APIHelper._();

  Future<List<NasaModal>?> nasaApidata() async {
    Uri url = Uri.parse(
        "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=JM1pH4LAuI5an0piy7i7TEmxmYiyJTdjOPivH9y9");

    http.Response res = await http.get(url);

    if (res.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(res.body);

      List photos = data['photos'];

      List<NasaModal> nasaModalList = photos
          .map(
            (e) => NasaModal.fromJson(json: e),
          )
          .toList();
      return nasaModalList;
    }
    return null;
  }
}
