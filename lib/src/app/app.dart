import 'package:flutter/material.dart';
import 'package:tif_assignment/src/presentation/home/home.dart';
import 'package:tif_assignment/src/ui/theme.dart';

class TIFApp extends StatelessWidget {
  const TIFApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: generateAppTheme(),
      home: const HomePage(),
    );
  }
}
