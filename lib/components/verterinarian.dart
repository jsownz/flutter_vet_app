import 'package:flutter/material.dart';

class Veterinarian extends StatelessWidget {
  String avatar;
  String vetName;
  Veterinarian({super.key, required this.avatar, required this.vetName});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image(
                image: AssetImage(avatar),
                height: 35,
                width: 35,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              vetName,
              style: TextStyle(
                fontFamily: 'Open Sans',
              ),
            ),
          ],
        ),
        const Icon(
          Icons.arrow_forward_ios,
          color: Color(0xff988F8B),
          size: 16,
        ),
      ],
    );
  }
}
