import 'package:flutter/material.dart';

class Paddings {
  const Paddings();

  EdgeInsets get defaultPadding => const EdgeInsets.all(24);

  EdgeInsets get top2_5 => const EdgeInsets.only(top: 2.5);

  EdgeInsets get cardPadding =>
      const EdgeInsets.symmetric(horizontal: 8, vertical: 7);
}
