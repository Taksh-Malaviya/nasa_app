import 'package:flutter/material.dart';
import 'package:nasa_app/Halper/nasaHalper.dart'; // Ensure this file exists
import 'package:nasa_app/Routes/routes.dart';
import '../../Modal/nasaModal.dart'; // Ensure this file exists

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NASA DATA"),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, Routes.fav),
            child: const Icon(
              Icons.star,
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<NasaModal>?>(
        future: APIHelper.apiHelper.nasaApidata(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<NasaModal>? nasaModalData = snapshot.data;
            return GridView.builder(
              itemCount: nasaModalData?.length ?? 0,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                childAspectRatio: 0.7,
                crossAxisSpacing: 5,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.detail,
                      arguments: nasaModalData![index],
                    );
                  },
                  child: Card(
                    surfaceTintColor: Colors.grey,
                    child: Column(
                      children: [
                        Image.network(nasaModalData![index].imgSrc),
                        Text(nasaModalData[index]
                            .earthDate
                            .toString()
                            .split(" ")
                            .first),
                        Text(
                            "Lunching date ${nasaModalData[index].rover.launchDate.toString().split(" ").first}"),
                        Text(
                            "Landing date ${nasaModalData[index].rover.landingDate.toString().split(" ").first}"),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
