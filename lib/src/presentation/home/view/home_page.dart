import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tif_assignment/src/constants.dart';
import 'package:tif_assignment/src/data/model/model.dart';
import 'package:tif_assignment/src/data/repository/repository.dart';
import 'package:tif_assignment/src/feature/feature.dart';
import 'package:tif_assignment/src/presentation/widgets/event_card.dart';
import 'package:tif_assignment/src/ui/theme.dart';

part 'home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = context.read<EventRepository>();

    return BlocProvider(
      create: (context) =>
          HomeBloc(repository: repository)..add(const HomeFetched()),
      child: const _HomeView(),
    );
  }
}
