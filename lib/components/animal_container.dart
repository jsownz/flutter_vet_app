import 'package:flutter/material.dart';
import 'package:flutter_vet_app/constants.dart';

class AnimalContainer extends StatelessWidget {
  bool isAlert = false;
  String animalName;
  String animalPicture;
  AnimalContainer(
      {super.key,
      required this.animalName,
      required this.animalPicture,
      this.isAlert = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            animalPicture,
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(
          8.0,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            decoration: const BoxDecoration(
              color: kOrange,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  animalName,
                  style: kBannerText,
                ),
                Visibility(
                  visible: isAlert,
                  child: const Icon(
                    Icons.info_outline,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
