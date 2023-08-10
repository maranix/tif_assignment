import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:tif_assignment/src/data/repository/event/event.dart';
import 'package:tif_assignment/src/presentation/home/home.dart';
import 'package:tif_assignment/src/ui/ui.dart';

class TIFApp extends StatelessWidget {
  const TIFApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => EventRepository(
        client: http.Client(),
      ),
      child: MaterialApp(
        theme: generateAppTheme(),
        home: const HomePage(),
      ),
    );
  }
}
