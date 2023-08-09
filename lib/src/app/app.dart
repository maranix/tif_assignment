import 'package:flutter/material.dart';
import 'package:tif_assignment/src/presentation/home/home.dart';

class TIFApp extends StatelessWidget {
  const TIFApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
