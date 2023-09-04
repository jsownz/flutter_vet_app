import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vet_app/components/animal_container.dart';
import 'package:flutter_vet_app/components/my_bottom_nav_bar.dart';
import 'package:flutter_vet_app/components/verterinarian.dart';
import 'package:flutter_vet_app/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white, // Change Background color
        systemNavigationBarIconBrightness: Brightness.dark, // Change Icon color
      ),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hi, Liana!",
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                      ),
                    ),
                    Stack(
                      children: [
                        Icon(
                          Icons.notifications,
                          color: Color(0xFFD1CECB),
                        ),
                        Positioned(
                          top: 1,
                          right: 2,
                          child: Text(
                            "+2",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "My Pets",
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: kButton,
                      child: const Text(
                        "Add",
                        style: kButtonText,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 250,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      AnimalContainer(
                          animalName: 'Marshall',
                          petImages: const [
                            'images/puppy.jpg',
                            "images/husky2.jpg",
                            "images/husky3.jpg",
                            "images/husky4.jpg"
                          ],
                          isAlert: true),
                      const SizedBox(
                        width: 15,
                      ),
                      AnimalContainer(animalName: "Luna", petImages: const [
                        'images/cat.jpg',
                        'images/cat2.jpg'
                      ]),
                      const SizedBox(
                        width: 15,
                      ),
                      AnimalContainer(animalName: "Lizzy", petImages: const [
                        'images/lizard.jpg',
                        'images/lizard2.jpg',
                        'images/lizard3.jpg'
                      ]),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Veterinarian",
                      style: kLargeLabel,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: kButton,
                      child: const Text(
                        "See All",
                        style: kButtonText,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Veterinarian(
                    avatar: "images/24.jpg", vetName: "Beatrice Bradley"),
                const Divider(
                  color: Color(0xFFF4F3F1),
                ),
                const Veterinarian(
                    avatar: "images/64.jpg", vetName: "Glen Gray"),
                const Divider(
                  color: Color(0xFFF4F3F1),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Training",
                      style: kLargeLabel,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: kButton,
                      child: const Text(
                        "See All",
                        style: kButtonText,
                      ),
                    ),
                  ],
                ),
                const Veterinarian(
                    avatar: "images/49.jpg", vetName: "Josephine Kelley"),
                const Divider(
                  color: Color(0xFFF4F3F1),
                ),
                const Veterinarian(
                    avatar: "images/25.jpg", vetName: "Theodore Allen"),
                const Divider(
                  color: Color(0xFFF4F3F1),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const MyBottomNavBar(selectedIndex: 0),
      ),
    );
  }
}
