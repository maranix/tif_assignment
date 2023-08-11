import 'dart:ui';

import 'package:flutter/material.dart';

class TextStyles {
  const TextStyles({
    this.color = Colors.black,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
  });

  final Color color;
  final Color primaryColor;
  final Color secondaryColor;

  TextStyle get appBarTitle => TextStyle(
        fontSize: 24,
        color: color,
        fontVariations: const [
          FontVariation('wght', 500),
        ],
      );

  TextStyle get cardSchedule => TextStyle(
        fontSize: 13,
        color: primaryColor,
        fontVariations: const [
          FontVariation('wght', 400),
        ],
      );

  TextStyle get cardTitle => TextStyle(
        fontSize: 15,
        color: color,
        fontVariations: const [
          FontVariation('wght', 500),
        ],
      );

  TextStyle get cardSubtitle => TextStyle(
        fontSize: 13,
        color: secondaryColor,
        fontVariations: const [
          FontVariation('wght', 400),
        ],
      );

  TextStyle get eventTitle => TextStyle(
        fontSize: 35,
        color: color,
        fontVariations: const [
          FontVariation('wght', 400),
        ],
      );

  TextStyle get eventInfoTitle => TextStyle(
        fontSize: 15,
        color: color,
        fontVariations: const [
          FontVariation('wght', 400),
        ],
      );

  TextStyle get eventInfoSubTitle => TextStyle(
        fontSize: 12,
        color: secondaryColor,
        fontVariations: const [
          FontVariation('wght', 400),
        ],
      );

  TextStyle get eventDescriptionTitle => TextStyle(
        fontSize: 18,
        color: color,
        fontVariations: const [
          FontVariation('wght', 500),
        ],
      );

  TextStyle get eventDescription => TextStyle(
        fontSize: 16,
        color: color,
        fontVariations: const [
          FontVariation('wght', 400),
        ],
      );

  TextStyle get primaryButtonStyle => const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontVariations: [
          FontVariation('wght', 500),
        ],
      );

  TextStyle get searchCardSchedule => TextStyle(
        fontSize: 12,
        color: primaryColor,
        fontVariations: const [
          FontVariation('wght', 500),
        ],
      );

  TextStyle get searchCardTitle => TextStyle(
        fontSize: 18,
        color: color,
        fontVariations: const [
          FontVariation('wght', 500),
        ],
      );
}
