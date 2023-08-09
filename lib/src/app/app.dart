import 'package:flutter/material.dart';
import 'package:tif_assignment/src/app/router.dart';

class TIFApp extends StatelessWidget {
  const TIFApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routes,
    );
  }
}
