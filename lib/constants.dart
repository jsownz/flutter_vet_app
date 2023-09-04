import 'package:flutter/material.dart';

const Color kOrange = Color(0xFFfd6d42);
const Color kLightGray = Color(0xFFD8D5D2);
const Color kMediumGray = Color(0xff988F8B);
const Color kDarkGray = Color(0xff766d69);
const Color kRed = Color(0xFFd4646d);

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

const kLargeHeading = TextStyle(
  fontFamily: 'Open Sans',
  fontWeight: FontWeight.bold,
  fontSize: 28,
);

const kDiscountText = TextStyle(
  fontFamily: 'Ope nSans',
  fontWeight: FontWeight.w400,
  color: kRed,
  fontSize: 20,
);

const kTabText = TextStyle(
  fontFamily: 'Open Sans',
  fontWeight: FontWeight.w500,
);

ButtonStyle kButton = ElevatedButton.styleFrom(
  elevation: 0,
  backgroundColor: Colors.transparent,
  padding: const EdgeInsets.only(
    right: 0,
  ),
);

ButtonStyle kSmallButton = ElevatedButton.styleFrom(
  elevation: 0,
  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
  minimumSize: Size.zero,
  backgroundColor: kOrange,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(6),
  ),
);
