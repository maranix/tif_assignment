import 'package:go_router/go_router.dart';
import 'package:tif_assignment/src/presentation/presentation.dart';

final routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/event/:id',
      builder: (context, state) {
        return const EventPage();
      },
    ),
  ],
);
