import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nasa_app/Modal/nasaModal.dart';
import 'package:nasa_app/Routes/routes.dart';
import 'package:provider/provider.dart';

import '../../Controller/nasaController.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    NasaModal nasaModal =
        ModalRoute.of(context)!.settings.arguments as NasaModal;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Screen"),
        actions: [
          Consumer<Nasacontroller>(builder: (context, provider, _) {
            return IconButton(
              onPressed: () {
                provider.Like();
                provider.addLikeData(nasaModal: nasaModal);
                //Navigator.pushNamed(context, Routes.fav, arguments: nasaModal);
              },
              icon: (!provider.isLike)
                  ? Icon(Icons.favorite_border)
                  : Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
            );
          }),
        ],
      ),
      body: Align(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(nasaModal.imgSrc),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Camera Man : ${nasaModal.camera.name}"),
                  Text("Total Photos: ${nasaModal.rover.totalPhotos}"),
                  Text(
                      "Landing Date: ${nasaModal.rover.landingDate.toString()}"),
                  Text("Launch Date: ${nasaModal.rover.launchDate}"),
                  Text("Status: ${nasaModal.rover.status}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
