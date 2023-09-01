import 'package:flutter/material.dart';
import 'package:flutter_vet_app/components/animal_container.dart';
import 'package:flutter_vet_app/components/verterinarian.dart';
import 'package:flutter_vet_app/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    style: kWhiteButton,
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
                        animalPicture: 'images/puppy.jpg',
                        isAlert: true),
                    const SizedBox(
                      width: 15,
                    ),
                    AnimalContainer(
                        animalName: "Luna", animalPicture: 'images/cat.jpg'),
                    const SizedBox(
                      width: 15,
                    ),
                    AnimalContainer(
                        animalName: "Lizzy",
                        animalPicture: 'images/lizard.jpg'),
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
                    style: kWhiteButton,
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
              Veterinarian(
                  avatar: "images/24.jpg", vetName: "Beatrice Bradley"),
              const Divider(
                color: Color(0xFFF4F3F1),
              ),
              Veterinarian(avatar: "images/64.jpg", vetName: "Glen Gray"),
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
                    style: kWhiteButton,
                    child: const Text(
                      "See All",
                      style: kButtonText,
                    ),
                  ),
                ],
              ),
              Veterinarian(
                  avatar: "images/49.jpg", vetName: "Josephine Kelley"),
              const Divider(
                color: Color(0xFFF4F3F1),
              ),
              Veterinarian(avatar: "images/25.jpg", vetName: "Theodore Allen"),
              const Divider(
                color: Color(0xFFF4F3F1),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: kOrange,
            ),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kOrange,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.pets,
              ),
              label: "My Pets",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.health_and_safety,
              ),
              label: "Clinic",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag,
              ),
              label: "Products",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.sentiment_satisfied,
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
