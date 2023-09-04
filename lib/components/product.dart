import 'package:flutter/material.dart';
import 'package:flutter_vet_app/constants.dart';

class Product extends StatelessWidget {
  final String image;
  final String description;
  final String price;
  final bool isFavorite;
  const Product(
      {super.key,
      required this.image,
      required this.description,
      required this.price,
      this.isFavorite = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFf0edec),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Image(
                image: AssetImage(image),
                width: 100,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      description,
                      softWrap: true,
                      textAlign: TextAlign.left,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$${price}"),
                        ElevatedButton(
                          onPressed: () {},
                          style: kSmallButton,
                          child: const Text(
                            "Buy",
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_outline,
              color: isFavorite ? Colors.red : kLightGray,
            ),
          ),
        ],
      ),
    );
  }
}
