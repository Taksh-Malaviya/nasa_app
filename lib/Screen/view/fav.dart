import 'package:flutter/material.dart';
import 'package:nasa_app/Modal/nasaModal.dart';
import 'package:provider/provider.dart';

import '../../Controller/nasaController.dart';

class Fav extends StatelessWidget {
  const Fav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fav Screen"),
      ),
      body: Consumer<Nasacontroller>(builder: (context, provider, child) {
        return ListView.builder(
          itemCount: provider.likeData.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.likeData[index]),
                  GestureDetector(
                      onTap: () => provider.removeLikedata(
                            name: provider.likeData[index],
                          ),
                      child: Icon(Icons.close)),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
