import 'package:flutter/material.dart';

class Paddings {
  const Paddings();

  EdgeInsets get defaultPadding => const EdgeInsets.all(24);

  EdgeInsets get top2_5 => const EdgeInsets.only(top: 2.5);

  EdgeInsets get all10_55 => const EdgeInsets.all(10.55);

  EdgeInsets get right13 => const EdgeInsets.only(right: 13);

  EdgeInsets get horizontal4 => const EdgeInsets.symmetric(horizontal: 4);

  EdgeInsets get primaryButtonPadding =>
      const EdgeInsets.only(top: 20, bottom: 19);

  EdgeInsets get floatingButtonPadding =>
      const EdgeInsets.only(top: 100, bottom: 23, left: 52, right: 52);

  EdgeInsets get cardPadding =>
      const EdgeInsets.symmetric(horizontal: 8, vertical: 7);
}
