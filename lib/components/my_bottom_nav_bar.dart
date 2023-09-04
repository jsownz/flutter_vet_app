import 'package:flutter/material.dart';
import 'package:flutter_vet_app/constants.dart';
import 'package:flutter_vet_app/screens/home_screen.dart';
import 'package:flutter_vet_app/screens/products_screen.dart';

class MyBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  const MyBottomNavBar({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: kOrange,
          ),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kOrange,
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
              break;
            case 2:
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ProductScreen(),
                ),
              );
              break;
          }
        },
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
    );
  }
}
