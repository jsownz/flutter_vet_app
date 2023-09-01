import 'package:flutter/material.dart';

const Color kOrange = Color(0xFFfd6d42);

const TextStyle kButtonText = TextStyle(
  fontFamily: 'Open Sans',
  color: kOrange,
);

const TextStyle kBannerText = TextStyle(
  fontFamily: 'Open Sans',
  fontSize: 15,
  fontWeight: FontWeight.w500,
  color: Colors.white,
);

const TextStyle kLargeLabel = TextStyle(
  fontFamily: 'Open Sans',
  fontSize: 20,
  fontWeight: FontWeight.w500,
);

ButtonStyle kWhiteButton = ElevatedButton.styleFrom(
  elevation: 0,
  backgroundColor: Colors.white,
  padding: const EdgeInsets.only(
    right: 0,
  ),
);
