import 'package:flutter/material.dart';
import 'package:flutter_vet_app/constants.dart';
import 'package:flutter_vet_app/view_pet_screen.dart';

class AnimalContainer extends StatelessWidget {
  final bool isAlert;
  final String animalName;
  List<String> petImages;

  AnimalContainer(
      {super.key,
      required this.animalName,
      required this.petImages,
      this.isAlert = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                ViewPetScreen(petName: animalName, petImages: petImages),
          ),
        );
      },
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              petImages.first,
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
      ),
    );
  }
}
